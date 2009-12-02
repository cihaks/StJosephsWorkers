class JobsController < ApplicationController
  layout "jobs_content"
  
  before_filter :get_client, :set_section
  
  # active_scaffold :job do |config|
  #   config.label = 'Client Job'
  #   config.list.columns = [:client, :company, :job_type, :start_date, :end_date, :pay_scale_low, :pay_scale_high, :medical, :dental, :pto, :retirement_401k, :full_time, :temp_to_hire]
  # end

  # GET /jobs
  # GET /jobs.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @jobs }
    end
  end
  
  # GET /jobs/1
  # GET /jobs/1.xml
  def show
    @job = @client.jobs.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.xml
  def new
    @job = @client.jobs.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job }
    end
  end

  # GET /jobs/1/edit
  def edit
    @job = @client.jobs.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.xml
  def create
    @job = @client.jobs.build(params[:job])

    respond_to do |format|
      if @job.save
          flash[:notice] = 'Job was successfully created.'
          format.html { redirect_to(client_jobs_url(@client)) }
          format.xml  { render :xml => @job, :status => :created, :location => @job }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.xml
  def update
    @job = @client.jobs.find(params[:id])

    respond_to do |format|
      if @job.update_attributes(params[:job])
        flash[:notice] = 'Job was successfully updated.'
        format.html { redirect_to(client_jobs_url(@client)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.xml
  def destroy
    @job = @client.jobs.find(params[:id])
    @job.destroy

    respond_to do |format|
      format.html { redirect_to(client_jobs_url(@client)) }
      format.xml  { head :ok }
    end
  end
  
  def set_section
    session[:jobs_section] = controller_name
  end
  
end
