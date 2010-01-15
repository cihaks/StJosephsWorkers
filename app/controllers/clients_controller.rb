class ClientsController < ApplicationController
  layout 'references'
  
  # GET /clients
  # GET /clients.xml
  def index
    
    @clients = Client.search(params[:query],params[:page],current_user.page_limit)
    
    respond_to do |format|
      format.html 
      format.js { render :layout=>false }
      format.xml  { render :xml => @clients }
    end
  end

  def clear
    @client = nil
    redirect_to(clients_url)
  end
  
  # GET /clients/1
  # GET /clients/1.xml
  def show
    @client = Client.find(params[:id])
    
    #redirect_to client_contacts_path(@client)
    
    respond_to do |format|
      format.html # show.html.erb
      format.js { render :layout=>'client-content' }
      format.xml  { render :xml => @client }
    end
  end

  # GET /clients/new
  # GET /clients/new.xml
  def new
    @client = Client.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @client }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
    respond_to do |format|
      format.html
      format.js { render :layout=>'client_content' }
    end
  end

  # POST /clients
  # POST /clients.xml
  def create
    @client = Client.new(params[:client])

    respond_to do |format|
      if @client.save
        flash[:notice] = 'Client was successfully created.'
        format.html { redirect_to(clients_url) }
        format.xml  { render :xml => @client, :status => :created, :location => @client }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.xml
  def update
    params[:client][:status_type_ids] ||= []
    
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        flash[:notice] = 'Client was successfully updated.'
        format.html { redirect_to(@client) }
        format.xml  { head :ok }
        format.js { render 'show', :layout=>'client_content'}
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.xml
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to(clients_url) }
      format.xml  { head :ok }
    end
  end
  
  def add_office_visit
    
  end
end
