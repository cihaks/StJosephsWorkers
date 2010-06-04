# == Schema Information
# Schema version: 20090924043100
#
# Table name: courses
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Course < ActiveRecord::Base
  has_many :registered_classes
  has_many :clients, :through => :registered_classes, :source => :client

  def self.search(search, page, page_limit)
    paginate :per_page=>page_limit, :page=>page,
             :conditions => ["name LIKE ? ", "%#{search}%"],
             :order => 'name'
  end
end
