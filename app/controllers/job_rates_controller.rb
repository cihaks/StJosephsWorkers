class JobRatesController < ApplicationController
  # GET /job_rates
  # GET /job_rates.xml
  def index
    @job_rates = JobRate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @job_rates }
    end
  end

  # GET /job_rates/1
  # GET /job_rates/1.xml
  def show
    @job_rate = JobRate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job_rate }
    end
  end

  # GET /job_rates/new
  # GET /job_rates/new.xml
  def new
    @job_rate = JobRate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job_rate }
    end
  end

  # GET /job_rates/1/edit
  def edit
    @job_rate = JobRate.find(params[:id])
  end

  # POST /job_rates
  # POST /job_rates.xml
  def create
    @job_rate = JobRate.new(params[:job_rate])

    respond_to do |format|
      if @job_rate.save
        flash[:notice] = 'JobRate was successfully created.'
        format.html { redirect_to(@job_rate) }
        format.xml  { render :xml => @job_rate, :status => :created, :location => @job_rate }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job_rate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /job_rates/1
  # PUT /job_rates/1.xml
  def update
    @job_rate = JobRate.find(params[:id])

    respond_to do |format|
      if @job_rate.update_attributes(params[:job_rate])
        flash[:notice] = 'JobRate was successfully updated.'
        format.html { redirect_to(@job_rate) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job_rate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /job_rates/1
  # DELETE /job_rates/1.xml
  def destroy
    @job_rate = JobRate.find(params[:id])
    @job_rate.destroy

    respond_to do |format|
      format.html { redirect_to(job_rates_url) }
      format.xml  { head :ok }
    end
  end
end
