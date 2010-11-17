# == Schema Information
# Schema version: 20100912050644
#
# Table name: job_rates
#
#  id               :integer(4)      not null, primary key
#  job_id           :integer(4)
#  hourly_rate      :decimal(6, 2)
#  hourly_rate_date :date
#  created_at       :datetime
#  updated_at       :datetime
#  creator_id       :integer(4)
#  updater_id       :integer(4)
#

class JobRate < ActiveRecord::Base
  belongs_to :job

	validates_date :hourly_rate_date
end
