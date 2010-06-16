# == Schema Information
# Schema version: 20100604003228
#
# Table name: job_applications
#
#  id               :integer(4)      not null, primary key
#  client_id        :integer(4)
#  company_id       :integer(4)
#  industry_id      :integer(4)
#  application_date :date
#  created_at       :datetime
#  updated_at       :datetime
#  creator_id       :integer(4)
#  updater_id       :integer(4)
#

class JobApplication < ActiveRecord::Base
  belongs_to :company
  belongs_to :client
  belongs_to :industry

	validates_date :application_date
	
	def company_name
	  company.name if company
	end
	
	def company_name=(name)
		self.company = Company.find_or_create_by_name(name) unless name.blank?
	end
  
end
