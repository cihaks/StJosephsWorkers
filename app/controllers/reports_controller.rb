class ReportsController < ApplicationController
  
  before_filter :set_reports
  
  require_role :admin
  
  def index
  end
  
  def jobs
    @jobs = Hash.new
    js = Job.find(:all,:conditions=>["start_date is not null and start_date >= ?",3.months.ago])
    @jobs[:new_3]=js.size
    js = Job.find(:all,:conditions=>["start_date is not null and start_date >= ? and start_date < ?",6.months.ago,3.months.ago])
    @jobs[:new_6]=js.size
    js = Job.find(:all,:conditions=>["start_date is not null and start_date < ?",6.months.ago])
    @jobs[:new_else]=js.size
    js = Job.find(:all,:conditions=>["end_date is null and start_date >= ?",3.months.ago] )
    @jobs[:retained_3]=js.size
    js = Job.find(:all,:conditions=>["end_date is null and start_date >= ? and start_date < ?",6.months.ago,3.months.ago] )
    @jobs[:retained_6]=js.size
    js = Job.find(:all,:conditions=>["end_date is null and start_date < ?",6.months.ago] )
    @jobs[:retained_else]=js.size
    js = Job.find(:all,:conditions=>["end_date is not null and start_date >= ?",3.months.ago] )
    @jobs[:lost_3]=js.size
    js = Job.find(:all,:conditions=>["end_date is not null and start_date >= ? and start_date < ?",6.months.ago,3.months.ago] )
    @jobs[:lost_6]=js.size
    js = Job.find(:all,:conditions=>["end_date is not null and start_date < ?",6.months.ago] )
    @jobs[:lost_else]=js.size
    js = Job.find(:all,:conditions=>"end_date is null")
    @jobs[:all_current]=js.size
    js = Job.find(:all,:conditions=>"end_date is not null")
    @jobs[:all_lost]=js.size
  end
  

	def job_leads
		@title = "Job Lead Tracking Report"
		session[:client_report_section] = "job_leads"
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
	
	
  def set_reports
    @reports_flag = true
  end
end
