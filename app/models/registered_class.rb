# == Schema Information
# Schema version: 20100604003228
#
# Table name: registered_classes
#
#  id         :integer(4)      not null, primary key
#  class_date :date
#  client_id  :integer(4)
#  course_id  :integer(4)
#  completed  :string(255)
#  created_at :datetime
#  updated_at :datetime
#  creator_id :integer(4)
#  updater_id :integer(4)
#

class RegisteredClass < ActiveRecord::Base
  belongs_to :course
  belongs_to :client

	validates_date :class_date
  
  def completed_value
    if completed == '0'
      "Completed"
    elsif completed == '1'
      "Waived"
    elsif completed == '2'
      "No Show"
    end
  end
end
