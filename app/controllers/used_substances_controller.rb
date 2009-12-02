class UsedSubstancesController < ApplicationController
  layout 'infamy_content'
  
  before_filter :get_client, :set_section
  
  # active_scaffold :used_substance do |config|
  #   config.label = 'Client Substance of Choice'
  #   config.columns[:client].form_ui = :select
  #   config.columns[:substance].form_ui = :select
  #   config.list.columns = [:client, :substance, :entry_date, :sober_date]
  # end

  # GET /used_substances
  # GET /used_substances.xml
  def index
    @used_substances = @client.used_substances.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @used_substances }
    end
  end

  # GET /used_substances/1
  # GET /used_substances/1.xml
  def show
    @used_substance = @client.used_substances.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @used_substance }
    end
  end

  # GET /used_substances/new
  # GET /used_substances/new.xml
  def new
    @used_substance = @client.used_substances.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @used_substance }
    end
  end

  # GET /used_substances/1/edit
  def edit
    @used_substance = @client.used_substances.find(params[:id])
  end

  # POST /used_substances
  # POST /used_substances.xml
  def create
    @used_substance = @client.used_substances.build(params[:used_substance])

    respond_to do |format|
      if @used_substance.save
        flash[:notice] = 'Used Substance was successfully created.'
        format.html { redirect_to(client_used_substances_url(@client)) }
        format.xml  { render :xml => @used_substance, :status => :created, :location => @used_substance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @used_substance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /used_substances/1
  # PUT /used_substances/1.xml
  def update
    @used_substance = @client.used_substances.find(params[:id])

    respond_to do |format|
      if @used_substance.update_attributes(params[:used_substance])
        flash[:notice] = 'Used Substance was successfully updated.'
        format.html { redirect_to(client_used_substances_url(@client)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @used_substance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /used_substances/1
  # DELETE /used_substances/1.xml
  def destroy
    @used_substance = @client.used_substances.find(params[:id])
    @used_substance.destroy

    respond_to do |format|
      format.html { redirect_to(client_used_substances_url(@client)) }
      format.xml  { head :ok }
    end
  end
  
  def set_section
    session[:infamy_section] = controller_name
  end

end
