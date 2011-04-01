# == Schema Information
# Schema version: 20110331225232
#
# Table name: job_leads
#
#  id                 :integer(4)      not null, primary key
#  client_id          :integer(4)
#  client_name        :string(255)
#  activity_date      :date
#  job_developer_id   :integer(4)
#  job_developer_name :string(255)
#  company            :string(255)
#  bus_pass           :boolean(1)
#  verified           :boolean(1)
#  application        :boolean(1)
#  interview          :boolean(1)
#  note               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class JobLead < ActiveRecord::Base
end
