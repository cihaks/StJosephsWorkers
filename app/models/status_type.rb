# == Schema Information
# Schema version: 20110331225232
#
# Table name: status_types
#
#  id                :integer(4)      not null, primary key
#  name              :string(255)
#  description       :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  creator_id        :integer(4)
#  updater_id        :integer(4)
#  icon_file_name    :string(255)
#  icon_content_type :string(255)
#  icon_file_size    :integer(4)
#  category          :string(255)
#

class StatusType < ActiveRecord::Base
  has_many :assigned_status_types
  has_many :resource_types  # 1 to 0 or more association
  has_attached_file :icon
  
	validates_uniqueness_of :name, :case_sensitive=>false, :allow_blank=>false
	validates_presence_of :name
	
	accepts_nested_attributes_for :assigned_status_types
	
  def self.search(search, page, page_limit)
    paginate :per_page=>page_limit, :page=>page,
             :conditions => ["name LIKE ?", "%#{search}%"],
             :order => 'name, inactive'
  end

end
