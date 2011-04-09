# == Schema Information
# Schema version: 20110331225232
#
# Table name: app_interviews
#
#  id           :integer(4)      not null, primary key
#  client_id    :integer(4)
#  company_id   :integer(4)
#  industry_id  :integer(4)
#  meeting_date :date
#  application  :boolean(1)
#  interview    :boolean(1)
#  created_at   :datetime
#  updated_at   :datetime
#  creator_id   :integer(4)
#  updater_id   :integer(4)
#

class AppInterview < ActiveRecord::Base
  belongs_to :client
  belongs_to :company
  belongs_to :industry

	validates_date :meeting_date

  def company_name
	  company.name if company
	end
	
	def company_name=(names)
		if names
		  name_list = names.split(',').each {|n| n.strip!}
		  name_list.each do |name|
		    self.company = Company.find_or_create_by_name(name) unless name.blank?
	    end
    end
	end

	def self.find_by_company_name(name)
		company = Company.find_by_name(name)
		self.find_by_company_id(company.id)
	end
	
	def self.find_by_meeting_date_and_company_name(meeting_date, name)
		company = Company.find_by_name(name)
		self.find_by_meeting_date_and_company_id(meeting_date, company.id)
	end
end
