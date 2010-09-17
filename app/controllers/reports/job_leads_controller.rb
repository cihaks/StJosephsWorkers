class Reports::JobLeadsController < Reports::ReportsController

	def index
		@title = "Job Lead Tracking Report"
		
		client_id = params[:id]
		@client = Client.find(client_id) unless client_id.nil?
		daily_pass_type = ResourceType.find_by_type_name("daily_pass")
		
		@job_leads = []
		
		# get applications / interviews
		apps = client_id.nil? ? AppInterview.all : @client.app_interviews
		apps.each do |app|
			developer_id = app.updater_id.nil? ? app.creator_id : app.updater_id
			developer = User.find(developer_id)
			lead = JobLead.new :client_id=>app.client_id, :client_name=>app.client.name, :activity_date=>app.meeting_date, :job_developer_id=>developer_id, :job_developer_name=>developer.name, :company=>app.company, :application=>app.application, :interview=>app.interview
			# check for bus pass
			resources = AssignedResource.find(:all, :conditions => ["resource_type_id = ? and client_id = ? and resource_date = ?",daily_pass_type.id,client_id,app.meeting_date])
			resources.each do |resource|
				lead.bus_pass, lead.verified = true, resource.verified if resource.daily_pass.company.match(lead.company.name)
			end
			@job_leads << lead unless lead.nil?
			lead = nil
		end
		
		respond_to do |format|
      format.html { render :layout => 'reports' }
			format.js   { render :layout => 'client_report_content' }
      format.xml  { render :xml => @job_leads }
    end
	end
	
	def set_section
    session[:client_report_section] = "job_leads"
  end
	
end
