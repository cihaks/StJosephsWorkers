# == Schema Information
# Schema version: 20110331225232
#
# Table name: courses
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  creator_id :integer(4)
#  updater_id :integer(4)
#

class Course < ActiveRecord::Base
  has_many :registered_classes
	has_many :scheduled_courses
  has_many :clients, :through => :registered_classes, :source => :client

	validates_uniqueness_of :name, :case_sensitive=>false, :allow_blank=>false
	validates_presence_of :name
	
  def self.search(search, page, page_limit)
    paginate :per_page=>page_limit, :page=>page,
             :conditions => ["name LIKE ? ", "%#{search}%"],
             :order => 'name'
  end
end
