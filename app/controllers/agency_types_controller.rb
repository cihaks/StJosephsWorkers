class AgencyTypesController < ApplicationController
  # GET /agency_types
  # GET /agency_types.xml
  def index
    @agency_types = AgencyType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @agency_types }
    end
  end

  # GET /agency_types/1
  # GET /agency_types/1.xml
  def show
    @agency_type = AgencyType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @agency_type }
    end
  end

  # GET /agency_types/new
  # GET /agency_types/new.xml
  def new
    @agency_type = AgencyType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @agency_type }
    end
  end

  # GET /agency_types/1/edit
  def edit
    @agency_type = AgencyType.find(params[:id])
  end

  # POST /agency_types
  # POST /agency_types.xml
  def create
    @agency_type = AgencyType.new(params[:agency_type])

    respond_to do |format|
      if @agency_type.save
        flash[:notice] = 'AgencyType was successfully created.'
        format.html { redirect_to(@agency_type) }
        format.xml  { render :xml => @agency_type, :status => :created, :location => @agency_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @agency_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /agency_types/1
  # PUT /agency_types/1.xml
  def update
    @agency_type = AgencyType.find(params[:id])

    respond_to do |format|
      if @agency_type.update_attributes(params[:agency_type])
        flash[:notice] = 'AgencyType was successfully updated.'
        format.html { redirect_to(@agency_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @agency_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /agency_types/1
  # DELETE /agency_types/1.xml
  def destroy
    @agency_type = AgencyType.find(params[:id])
    @agency_type.destroy

    respond_to do |format|
      format.html { redirect_to(agency_types_url) }
      format.xml  { head :ok }
    end
  end
end
