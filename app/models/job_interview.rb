# == Schema Information
# Schema version: 20090924043100
#
# Table name: job_interviews
#
#  id             :integer(4)      not null, primary key
#  client_id      :integer(4)
#  company_id     :integer(4)
#  interview_date :date
#  created_at     :datetime
#  updated_at     :datetime
#

class JobInterview < ActiveRecord::Base
  belongs_to :company
  belongs_to :client
  belongs_to :industry
end
