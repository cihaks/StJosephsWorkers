# == Schema Information
# Schema version: 20100912050644
#
# Table name: daily_passes
#
#  id                   :integer(4)      not null, primary key
#  assigned_resource_id :integer(4)
#  company              :string(255)
#  note                 :string(2048)
#  application          :boolean(1)
#  interview            :boolean(1)
#  created_at           :datetime
#  updated_at           :datetime
#  creator_id           :integer(4)
#  updater_id           :integer(4)
#

class DailyPass < ActiveRecord::Base
	
	belongs_to :assigned_resource
	
	after_create :add_interview
	after_update :check_interview
	
	def add_interview
		if interview or application
			name_list = company.split(',').each {|n| n.strip!}
			name_list.each do |company_name|
				#create app_interview object and save
				app_interview = AppInterview.new
				app_interview.client = assigned_resource.client
				app_interview.interview = interview
				app_interview.application = application
				app_interview.meeting_date = assigned_resource.resource_date
				app_interview.company_name = company_name
				app_interview.save
		  end
		end
	end
	
	def check_interview
		# first check if daily pass has changed
		if self.changed?
			# get all old company names
			was_name_list = company_was.split(',').each {|n| n.strip!}
			was_name_list.each do |old_company_name|
				# remove each app/interview for the old company and old date
			  app_interview = AppInterview.find_by_meeting_date_and_company_name(assigned_resource.resource_date_was, old_company_name)
			  app_interview.destroy if app_interview
		  end
		  
		  # loop through new company names and create an app/interview
		  if interview or application
				name_list = company.split(',').each {|n| n.strip!}
				name_list.each do |company_name|
					app_interview = AppInterview.new
					app_interview.client = assigned_resource.client
					app_interview.interview = interview
					app_interview.application = application
					app_interview.meeting_date = assigned_resource.resource_date
					app_interview.company_name = company_name
					app_interview.save
			  end
			end
	  end
	end
	
end
