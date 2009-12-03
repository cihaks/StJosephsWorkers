class ClientsController < ApplicationController
  layout 'references', :except=>[:list]
  
  # active_scaffold :client do |config|
  #     config.actions = [:list, :show, :update, :delete]
  #     config.actions.exclude :nested
  #     config.action_links.add 'new',:label=>'Add Client', :inline=>false
  #     config.columns[:race].form_ui = :select
  #     config.columns[:caution].form_ui = :checkbox
  #     config.columns[:resource_eligible].form_ui = :checkbox
  #     config.columns[:veteran].form_ui = :checkbox
  #     config.columns[:success_story].form_ui = :checkbox
  #     config.list.columns = [:id, :first_name, :middle_name, :last_name, :birth_date, :gender, :caution, :resource_eligible, :veteran, :success_story, :race]
  #     config.show.columns = [:id, :first_name, :middle_name, :last_name, :birth_date, :gender, :caution, :resource_eligible, :veteran, :success_story, :race, :substances, :courses]
  #     config.show.link.inline = false
  #     config.update.link.inline = false
#    config.create.columns = [:id, :first_name, :middle_name, :last_name, :birth_date, :gender, :caution, :resource_eligible, :veteran, :success_story, :race]
  # end

  # GET /clients
  # GET /clients.xml
  def index
    
    @clients = Client.search(params[:query],params[:page],current_user.page_limit)
    
    respond_to do |format|
      format.js { render :layout=>false }
      format.html 
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
      format.js { render :action=>"edit", :layout=>false }
      format.html
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
        format.js do
          render :update do |page|
            page.replace_html 'client-content', :partial=>'shared/client_show'
          end
        end
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
end
