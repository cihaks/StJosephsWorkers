class JobInterviewsController < ApplicationController
  layout 'jobs_content'
  
  before_filter :get_client
  before_filter :set_section
  
  # active_scaffold :job_interview do |config|
  #   config.label = 'Job Interview'
  #   config.columns[:client].form_ui = :select
  #   config.columns[:company].form_ui = :select
  #   config.columns[:interview_date].label = 'Interview Date'
  #   config.columns = [:client, :company, :interview_date]
  # end

  # GET /job_interviews
  # GET /job_interviews.xml
  def index
    @job_interviews = @client.job_interviews.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @job_interviews }
    end
  end

  # GET /job_interviews/1
  # GET /job_interviews/1.xml
  def show
    @job_interview = @client.job_interviews.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job_interview }
    end
  end

  # GET /job_interviews/new
  # GET /job_interviews/new.xml
  def new
    @job_interview = @client.job_interviews.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job_interview }
    end
  end

  # GET /job_interviews/1/edit
  def edit
    @job_interview = @client.job_interviews.find(params[:id])
  end

  # POST /job_interviews
  # POST /job_interviews.xml
  def create
    @job_interview = @client.job_interviews.build(params[:job_interview])

    respond_to do |format|
      if @job_interview.save
        flash[:notice] = 'JobInterview was successfully created.'
        format.html { redirect_to(client_job_interviews_url(@client)) }
        format.xml  { render :xml => @job_interview, :status => :created, :location => @job_interview }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job_interview.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /job_interviews/1
  # PUT /job_interviews/1.xml
  def update
    @job_interview = @client.job_interviews.find(params[:id])

    respond_to do |format|
      if @job_interview.update_attributes(params[:job_interview])
        flash[:notice] = 'JobInterview was successfully updated.'
        format.html { redirect_to(client_job_interviews_url(@client)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job_interview.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /job_interviews/1
  # DELETE /job_interviews/1.xml
  def destroy
    @job_interview = @client.job_interviews.find(params[:id])
    @job_interview.destroy

    respond_to do |format|
      format.html { redirect_to(client_job_interviews_url(@client)) }
      format.xml  { head :ok }
    end
  end
  
  def set_section
    session[:jobs_section] = "job_interviews"
  end
  
end
