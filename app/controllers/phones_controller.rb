class PhonesController < ApplicationController
  layout 'contacts_content'
  
  before_filter :get_client, :set_section
  
  # active_scaffold :phone do |config|
  #   config.label = 'Client Phone'
  # end

  # GET /phones
  # GET /phones.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @phones }
    end
  end

  # GET /phones/1
  # GET /phones/1.xml
  def show
    @phone = @client.phones.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @phone }
    end
  end

  # GET /phones/new
  # GET /phones/new.xml
  def new
    @phone = @client.phones.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @phone }
    end
  end

  # GET /phones/1/edit
  def edit
    @phone = @client.phones.find(params[:id])
  end

  # POST /phones
  # POST /phones.xml
  def create
    @phone = @client.phones.build(params[:phone])

    respond_to do |format|
      if @phone.save
        flash[:notice] = 'Phone was successfully created.'
        format.html { redirect_to(client_phones_url) }
        format.xml  { render :xml => @phone, :status => :created, :location => @phone }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @phone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /phones/1
  # PUT /phones/1.xml
  def update
    @phone = @client.phones.find(params[:id])

    respond_to do |format|
      if @phone.update_attributes(params[:phone])
        flash[:notice] = 'Phone was successfully updated.'
        format.html { redirect_to(client_phones_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @phone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /phones/1
  # DELETE /phones/1.xml
  def destroy
    @phone = @client.phones.find(params[:id])
    @phone.destroy

    respond_to do |format|
      format.html { redirect_to(client_phones_url) }
      format.xml  { head :ok }
    end
  end
  
  def set_section
    session[:contacts_section] = controller_name
  end
end
