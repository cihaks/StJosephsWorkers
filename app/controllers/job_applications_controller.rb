class JobApplicationsController < ApplicationController
  layout 'jobs_content'
  
  before_filter :get_client
  before_filter :set_section
  
  # active_scaffold :job_application do |config|
  #   config.label = 'Job Application'
  #   config.columns[:client].form_ui = :select
  #   config.columns[:company].form_ui = :select
  #   config.columns[:application_date].label = 'Application Date'
  #   config.columns = [:client, :company, :application_date]
  # end

  # GET /job_applications
  # GET /job_applications.xml
  def index
    @job_applications = @client.job_applications.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @job_applications }
    end
  end

  # GET /job_applications/1
  # GET /job_applications/1.xml
  def show
    @job_application = @client.job_applications.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job_application }
    end
  end

  # GET /job_applications/new
  # GET /job_applications/new.xml
  def new
    @job_application = @client.job_applications.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job_application }
    end
  end

  # GET /job_applications/1/edit
  def edit
    @job_application = @client.job_applications.find(params[:id])
  end

  # POST /job_applications
  # POST /job_applications.xml
  def create
    @job_application = @client.job_applications.build(params[:job_application])

    respond_to do |format|
      if @job_application.save
        flash[:notice] = 'JobApplication was successfully created.'
        format.html { redirect_to(client_job_applications_url(@client)) }
        format.xml  { render :xml => @job_application, :status => :created, :location => @job_application }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job_application.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /job_applications/1
  # PUT /job_applications/1.xml
  def update
    @job_application = @client.job_applications.find(params[:id])

    respond_to do |format|
      if @job_application.update_attributes(params[:job_application])
        flash[:notice] = 'JobApplication was successfully updated.'
        format.html { redirect_to(client_job_applications_url(@client)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job_application.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /job_applications/1
  # DELETE /job_applications/1.xml
  def destroy
    @job_application = @client.job_applications.find(params[:id])
    @job_application.destroy

    respond_to do |format|
      format.html { redirect_to(client_job_applications_url(@client)) }
      format.xml  { head :ok }
    end
  end
  
  def set_section
    session[:jobs_section] = "job_applications"
  end
end
