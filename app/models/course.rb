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
end
