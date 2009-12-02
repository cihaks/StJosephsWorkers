# == Schema Information
# Schema version: 20090924043100
#
# Table name: industries
#
#  id            :integer(4)      not null, primary key
#  industry_type :string(255)
#  description   :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

# == Schema Information
# Schema version: 20090716055901
#
# Table name: industries
#
#  id            :integer(4)      not null, primary key
#  industry_type :string(255)
#  description   :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Industry < ActiveRecord::Base
  has_many :jobs
  has_many :job_applications
  has_many :job_interviews
end
