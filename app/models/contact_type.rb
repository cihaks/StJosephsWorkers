# == Schema Information
# Schema version: 20110331225232
#
# Table name: contact_types
#
#  id                :integer(4)      not null, primary key
#  name              :string(25)
#  description       :string(500)
#  created_at        :datetime
#  updated_at        :datetime
#  creator_id        :integer(4)
#  updater_id        :integer(4)
#  default_selection :boolean(1)
#

class ContactType < ActiveRecord::Base
  has_many :contacts

	validates_uniqueness_of :name, :case_sensitive=>false, :allow_blank=>false
	validates_presence_of :name
	
  def self.search(search, page, page_limit)
    paginate :per_page=>page_limit, :page=>page,
             :conditions => ["name LIKE ? ", "%#{search}%"],
             :order => 'name'
  end
end
