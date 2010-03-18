class ActivityLogsController < ApplicationController
  # GET /activity_logs
  # GET /activity_logs.xml
  def index
    @activity_logs = ActivityLog.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activity_logs }
    end
  end

  # GET /activity_logs/1
  # GET /activity_logs/1.xml
  def show
    @activity_log = ActivityLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @activity_log }
    end
  end

  # GET /activity_logs/new
  # GET /activity_logs/new.xml
  def new
    @activity_log = ActivityLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @activity_log }
    end
  end

  # GET /activity_logs/1/edit
  def edit
    @activity_log = ActivityLog.find(params[:id])
  end

  # POST /activity_logs
  # POST /activity_logs.xml
  def create
    @activity_log = ActivityLog.new(params[:activity_log])

    respond_to do |format|
      if @activity_log.save
        flash[:notice] = 'ActivityLog was successfully created.'
        format.html { redirect_to(@activity_log) }
        format.xml  { render :xml => @activity_log, :status => :created, :location => @activity_log }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @activity_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /activity_logs/1
  # PUT /activity_logs/1.xml
  def update
    @activity_log = ActivityLog.find(params[:id])

    respond_to do |format|
      if @activity_log.update_attributes(params[:activity_log])
        flash[:notice] = 'ActivityLog was successfully updated.'
        format.html { redirect_to(@activity_log) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @activity_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_logs/1
  # DELETE /activity_logs/1.xml
  def destroy
    @activity_log = ActivityLog.find(params[:id])
    @activity_log.destroy

    respond_to do |format|
      format.html { redirect_to(activity_logs_url) }
      format.xml  { head :ok }
    end
  end
end
