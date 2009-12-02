class AssignedAgenciesController < ApplicationController
  layout 'infamy_content'
  
  before_filter :get_client, :set_section
  
  # active_scaffold :assigned_agency do |config|
  #   config.label = 'Client Agency'
  #   config.list.columns = [:client, :agency, :start_date, :end_date]
  # end
  
  # GET /client_agencies
  # GET /client_agencies.xml
  def index
    @assigned_agencies = @client.assigned_agencies.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @assigned_agencies }
    end
  end

  # GET /client_agencies/1
  # GET /client_agencies/1.xml
  def show
    @assigned_agency = @client.assigned_agencies.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @assigned_agency }
    end
  end

  # GET /client_agencies/new
  # GET /client_agencies/new.xml
  def new
    @assigned_agency = @client.assigned_agencies.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @assigned_agency }
    end
  end

  # GET /client_agencies/1/edit
  def edit
    @assigned_agency = @client.assigned_agencies.find(params[:id])
  end

  # POST /client_agencies
  # POST /client_agencies.xml
  def create
    @assigned_agency = @client.assigned_agencies.new(params[:assigned_agency])

    respond_to do |format|
      if @assigned_agency.save
        flash[:notice] = 'AssignedAgency was successfully created.'
        format.html { redirect_to( client_assigned_agencies_url(@client) ) }
        format.xml  { render :xml => @assigned_agency, :status => :created, :location => @assigned_agency }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @assigned_agency.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /client_agencies/1
  # PUT /client_agencies/1.xml
  def update
    @assigned_agency = @client.assigned_agencies.find(params[:id])

    respond_to do |format|
      if @assigned_agency.update_attributes(params[:assigned_agency])
        flash[:notice] = 'AssignedAgency was successfully updated.'
        format.html { redirect_to( client_assigned_agency_path(@client,@assigned_agency) ) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @assigned_agency.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /client_agencies/1
  # DELETE /client_agencies/1.xml
  def destroy
    @assigned_agency = @client.assigned_agencies.find(params[:id])
    @assigned_agency.destroy

    respond_to do |format|
      format.html { redirect_to( client_assigned_agencies_url(@client) ) }
      format.xml  { head :ok }
    end
  end
  
  def set_section
    session[:infamy_section] = controller_name
  end
end
