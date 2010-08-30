# == Schema Information
# Schema version: 20100604003228
#
# Table name: daily_passes
#
#  id                   :integer(4)      not null, primary key
#  assigned_resource_id :integer(4)
#  company              :string(255)
#  note                 :string(2048)
#  created_at           :datetime
#  updated_at           :datetime
#

class DailyPass < ActiveRecord::Base
	
	after_create :add_interview
	
	after_update :check_interview
	
	def add_interview
		if interview or application
			#create app_interview object and save
			app_interview = AppInterview.new
			app_interview.client = assigned_resource.client
			app_interview.interview = interview
			app_interview.application = application
			app_interview.meeting_date = assigned_resource.resource_date
			app_interview.company_name = company
			app_interview.save
		end
	end
	
	def check_interview
		if self.changed?
			app_interview = AppInterview.find_by_meeting_date_and_company_name(assigned_resource.resource_date, company_was)
			app_interview = AppInterview.new unless app_interview
			
			app_interview.client = assigned_resource.client
			app_interview.interview = interview
			app_interview.application = application
			app_interview.meeting_date = assigned_resource.resource_date
			app_interview.company_name = company
			app_interview.save
	  end
	end
	
end
