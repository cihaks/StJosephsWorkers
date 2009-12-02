# == Schema Information
# Schema version: 20090924043100
#
# Table name: registered_classes
#
#  id         :integer(4)      not null, primary key
#  class_date :date
#  waive_date :date
#  client_id  :integer(4)
#  course_id  :integer(4)
#  completed  :boolean(1)
#  created_at :datetime
#  updated_at :datetime
#

class RegisteredClass < ActiveRecord::Base
  belongs_to :course
  belongs_to :client
end
