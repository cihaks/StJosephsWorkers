class AddressesController < ApplicationController
  layout 'contacts_content'
  
  before_filter :get_client, :set_section
  
  # GET /addresses
  # GET /addresses.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @addresses }
    end
  end

  # GET /addresses/1
  # GET /addresses/1.xml
  def show
    @address = @client.addresses.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @address }
    end
  end

  # GET /addresses/new
  # GET /addresses/new.xml
  def new
    @address = @client.addresses.build
    state = State.find_by_code('AZ')
    @address.state = state
    
    @primary_address = @client.addresses.find_by_address_type_id(AddressType.find(:first, :conditions => ['name like ?','%Primary%']))

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @address }
    end
  end

  # GET /addresses/1/edit
  def edit
    @address = @client.addresses.find(params[:id])
  end

  # POST /addresses
  # POST /addresses.xml
  def create
    @address = @client.addresses.new(params[:address])
    # TODO:  update previous address and set end date???
    
    respond_to do |format|
      if @address.save
        flash[:notice] = 'Address was successfully created.'
        format.html { redirect_to( client_addresses_url(@client) ) }
        format.xml  { render :xml => @address, :status => :created, :location => @address }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /addresses/1
  # PUT /addresses/1.xml
  def update
    @address = @client.addresses.find(params[:id])
    # TODO:  update previous address and set end date???

    respond_to do |format|
      if @address.update_attributes(params[:address])
        flash[:notice] = 'Address was successfully updated.'
        format.html { redirect_to( client_addresses_url(@client) ) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.xml
  def destroy
    @address = @client.addresses.find(params[:id])
    @address.destroy
    # TODO:  check for existing current address???

    respond_to do |format|
      format.html { redirect_to( client_addresses_url(@client) ) }
      format.xml  { head :ok }
    end
  end
  
  def set_section
    session[:contacts_section] = controller_name
  end
end
