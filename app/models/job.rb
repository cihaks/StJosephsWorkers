# == Schema Information
# Schema version: 20090924043100
#
# Table name: jobs
#
#  id              :integer(4)      not null, primary key
#  client_id       :integer(4)
#  job_type_id     :integer(4)
#  company_id      :integer(4)
#  pay_scale_low   :integer(4)
#  pay_scale_high  :integer(4)
#  current         :boolean(1)
#  medical         :boolean(1)
#  dental          :boolean(1)
#  retirement_401k :boolean(1)
#  pto             :boolean(1)
#  full_time       :boolean(1)
#  temp_to_hire    :boolean(1)
#  start_date      :date
#  end_date        :date
#  created_at      :datetime
#  updated_at      :datetime
#

class Job < ActiveRecord::Base
  belongs_to :client
  belongs_to :job_type
  belongs_to :company
  belongs_to :industry
  has_many :job_rates
  
  def benefits
    if medical or dental or retirement_401k or pto 
      return true
    end
    false
  end
end
