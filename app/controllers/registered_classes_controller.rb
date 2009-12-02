class RegisteredClassesController < ApplicationController
  layout 'jobs_content'
  
  before_filter :get_client, :set_section
  
  # active_scaffold :registered_classes do |config|
  #   config.label = 'Registered Classes'
  # end

  # GET /registered_classes
  # GET /registered_classes.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @registered_classes }
    end
  end

  # GET /registered_classes/1
  # GET /registered_classes/1.xml
  def show
    @registered_class = @client.registered_classes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @registered_classes }
    end
  end

  # GET /registered_classes/new
  # GET /registered_classes/new.xml
  def new
    @registered_class = @client.registered_classes.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @registered_classes }
    end
  end

  # GET /registered_classes/1/edit
  def edit
    @registered_class = @client.registered_classes.find(params[:id])
  end

  # POST /registered_classes
  # POST /registered_classes.xml
  def create
    @registered_class = @client.registered_classes.build(params[:registered_class])

    respond_to do |format|
      if @registered_class.save
        flash[:notice] = 'RegisteredClass was successfully created.'
        format.html { redirect_to(client_registered_classes_url(@client)) }
        format.xml  { render :xml => @registered_class, :status => :created, :location => @registered_classes }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @registered_class.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /registered_classes/1
  # PUT /registered_classes/1.xml
  def update
    @registered_class = @client.registered_classes.find(params[:id])

    respond_to do |format|
      if @registered_class.update_attributes(params[:registered_class])
        flash[:notice] = 'RegisteredClass was successfully updated.'
        format.html { redirect_to(client_registered_classes_url(@client)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @registered_class.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /registered_classes/1
  # DELETE /registered_classes/1.xml
  def destroy
    @registered_class = @client.registered_classes.find(params[:id])
    @registered_class.destroy

    respond_to do |format|
      format.html { redirect_to(client_registered_classes_url(@client)) }
      format.xml  { head :ok }
    end
  end
  
  def set_section
    session[:jobs_section] = "registered_classes"
  end
end
