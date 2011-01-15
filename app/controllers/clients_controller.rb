class ClientsController < ApplicationController
  layout 'references'

	ssl_required :index, :clear, :show, :new, :edit, :create, :update, :destroy
  
  # GET /clients
  # GET /clients.xml
  def index
    
    @clients = Client.search(params[:query],params[:page],current_user.page_limit)
		
    @office_visit = ContactType.find(:first, :conditions => ['name like ?','Office Visit%'])
    
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
    
    @activity_logs = ActivityLog.search(@client.id, current_user.log_limit)
    
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
		contact_type = ContactType.find_by_default_selection(true)
		@client.contacts.build( :contact_type => contact_type )
		@client.addresses.build
		@client.phones.build
		@client.assigned_agencies.build
		@client.crime_sentences.build
		@client.registered_classes.build
		@client.used_substances.build

    respond_to do |format|
      format.html { render :layout=>'client_new' }
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
        format.html { redirect_to(client_url(@client)) }
        format.xml  { render :xml => @client, :status => :created, :location => @client }
      else
				@crime_sentence = @client.crime_sentences.first
				@errors = @client.errors
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
        format.js do
          render :update do |page|
            page.replace_html "client-element", :partial=>'/clients/show'
          end
        end
      else
				@errors = @client.errors
				error_div = "client-element-errors"
        format.html { render :action => "edit" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
				format.js do
					render :update do |page|
						page.hide error_div
						page.replace_html error_div, :partial=>'/shared/errors_index'
						page.visual_effect :appear, error_div, :duration=>2
					end
				end
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.xml
  def destroy
    client = Client.find(params[:id])
    client.deleted = true
		client.save

    respond_to do |format|
      format.html do
        render :update do |page|
					page.hide "#{client.id}", "#{client.id}_line"
        end
      end
      format.xml  { head :ok }
			format.js do
        render :update do |page|
					page.hide "#{client.id}", "#{client.id}_line"
        end
      end
    end
  end
end
