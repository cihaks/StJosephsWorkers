class ContactsController < ApplicationController
  layout 'contacts_content'
  
  before_filter :get_client, :set_section
  
  
  # GET /contacts
  # GET /contacts.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contacts }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.xml
  def new
    @contact = Contact.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contact }
    end
  end

  # GET /contacts/1/edit
  def edit
    
  end

  # POST /contacts
  # POST /contacts.xml
  def create
    @contact = Contact.new(params[:contact])
    @contact.client = @client

    respond_to do |format|
      if @contact.save
        flash[:notice] = 'Contact was successfully created.'
        format.html { redirect_to(client_contacts_path(@client) ) }
        format.xml  { render :xml => @contact, :status => :created, :location => @contact }
        format.js do
          render :update do |page|
            page.replace_html 'client-content', :partial=>'shared/client_show'
            page.replace_html 'contacts-element', :partial=>'contacts/index'
          end
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.xml
  def update

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        flash[:notice] = 'Contact was successfully updated.'
        format.html { redirect_to(client_contacts_path(@client) ) }
        format.xml  { head :ok }
        format.js do
          render :update do |page|
            page.replace_html 'client-content', :partial=>'shared/client_show'
            page.replace_html 'contacts-element', :partial=>'contacts/index'
          end
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.xml
  def destroy
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to(client_contacts_path(@client)) }
      format.xml  { head :ok }
    end
  end
  
  def get_client
    @client = Client.find(params[:client_id])
    @contact = @client.contacts.find(params[:id]) unless params[:id].nil?
  end
  
  def set_section
    session[:contacts_section] = controller_name
  end

end
