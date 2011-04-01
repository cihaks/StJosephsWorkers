# == Schema Information
# Schema version: 20110331225232
#
# Table name: jobs
#
#  id                 :integer(4)      not null, primary key
#  client_id          :integer(4)
#  job_type_id        :integer(4)
#  industry_id        :integer(4)
#  pay_scale_low      :integer(4)
#  pay_scale_high     :integer(4)
#  current            :boolean(1)
#  start_date         :date
#  end_date           :date
#  last_verified_date :date
#  created_at         :datetime
#  updated_at         :datetime
#  creator_id         :integer(4)
#  updater_id         :integer(4)
#  benefits_type_id   :integer(4)
#  company_id         :integer(4)
#

class Job < ActiveRecord::Base
  belongs_to :client
  belongs_to :job_type
  belongs_to :company
  belongs_to :industry
  belongs_to :benefits_type
  has_many :job_rates, :order=>"hourly_rate_date DESC", :dependent => :destroy
  accepts_nested_attributes_for :job_rates, :allow_destroy => true, :reject_if => lambda { |a| a[:hourly_rate].blank? }

	attr_writer :company_name
	before_save :assign_company
  
  validates_date :start_date, :allow_blank=>true
  validates_date :end_date, :allow_blank=>true
  validates_date :last_verified_date, :allow_blank=>true

  def company_name
	  if company
			company.name
		else
			@company_name
		end
	end
	
	private
	
	def assign_company
		if @company_name
		  company = Company.find_or_create_by_name(@company_name)
			self.company = company
	  end
	end

end
