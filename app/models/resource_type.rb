# == Schema Information
# Schema version: 20110331225232
#
# Table name: resource_types
#
#  id             :integer(4)      not null, primary key
#  name           :string(255)
#  description    :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  creator_id     :integer(4)
#  updater_id     :integer(4)
#  type_name      :string(255)
#  status_type_id :integer(4)
#

class ResourceType < ActiveRecord::Base
  has_many :assigned_resources
  belongs_to :status_type # 1 to 0 or more association

	validates_uniqueness_of :name, :case_sensitive=>false, :allow_blank=>false
	validates_presence_of :name
	
  def self.search(search, page, page_limit)
    paginate :per_page=>page_limit, :page=>page,
             :conditions => ["name LIKE ? ", "%#{search}%"],
             :order => 'name'
  end
end
