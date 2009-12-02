# == Schema Information
# Schema version: 20090924043100
#
# Table name: job_types
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class JobType < ActiveRecord::Base
  has_many :jobs
end
