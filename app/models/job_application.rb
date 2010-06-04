# == Schema Information
# Schema version: 20090924043100
#
# Table name: job_applications
#
#  id               :integer(4)      not null, primary key
#  client_id        :integer(4)
#  company_id       :integer(4)
#  application_date :date
#  created_at       :datetime
#  updated_at       :datetime
#

class JobApplication < ActiveRecord::Base
  belongs_to :company
  belongs_to :client
  belongs_to :industry
end
