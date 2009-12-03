class AssignedResourcesController < ApplicationController
  layout 'contacts_content'
  
  before_filter :get_client, :set_section
  
  # GET /assigned_resources
  # GET /assigned_resources.xml
  def index
    @assigned_resources = @client.assigned_resources.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @assigned_resources }
    end
  end

  # GET /assigned_resources/1
  # GET /assigned_resources/1.xml
  def show
    @assigned_resource = @client.assigned_resources.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @assigned_resource }
    end
  end

  # GET /assigned_resources/new
  # GET /assigned_resources/new.xml
  def new
    @assigned_resource = @client.assigned_resources.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @assigned_resource }
    end
  end

  # GET /assigned_resources/1/edit
  def edit
    @assigned_resource = @client.assigned_resources.find(params[:id])
  end

  # POST /assigned_resources
  # POST /assigned_resources.xml
  def create
    @assigned_resource = @client.assigned_resources.build(params[:assigned_resource])

    respond_to do |format|
      if @assigned_resource.save
        flash[:notice] = 'AssignedResource was successfully created.'
        format.html { redirect_to(client_assigned_resources_path(@client) ) }
        format.xml  { render :xml => @assigned_resource, :status => :created, :location => @assigned_resource }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @assigned_resource.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /assigned_resources/1
  # PUT /assigned_resources/1.xml
  def update
    params[:assigned_resource][:company_ids] ||= []

    @assigned_resource = @client.assigned_resources.find(params[:id])

    respond_to do |format|
      if @assigned_resource.update_attributes(params[:assigned_resource])
        flash[:notice] = 'AssignedResource was successfully updated.'
        format.html { redirect_to(client_assigned_resources_path(@client) ) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @assigned_resource.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /assigned_resources/1
  # DELETE /assigned_resources/1.xml
  def destroy
    @assigned_resource = @client.assigned_resources.find(params[:id])
    @assigned_resource.destroy

    respond_to do |format|
      format.html { redirect_to(client_assigned_resources_path(@client) ) }
      format.xml  { head :ok }
    end
  end
  
  def set_section
    session[:contacts_section] = controller_name
  end

end
