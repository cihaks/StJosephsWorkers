class ConvictionsController < ApplicationController
	layout 'references'
	
  # GET /convictions
  # GET /convictions.xml
  def index
    @convictions = Conviction.search(params[:query],params[:page],current_user.page_limit)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @convictions }
    end
  end

  # GET /convictions/1
  # GET /convictions/1.xml
  def show
    @conviction = Conviction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @conviction }
    end
  end

  # GET /convictions/new
  # GET /convictions/new.xml
  def new
    @conviction = Conviction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @conviction }
    end
  end

  # GET /convictions/1/edit
  def edit
    @conviction = Conviction.find(params[:id])
  end

  # POST /convictions
  # POST /convictions.xml
  def create
    @conviction = Conviction.new(params[:conviction])

    respond_to do |format|
      if @conviction.save
        flash[:notice] = 'Conviction was successfully created.'
        format.html { redirect_to(convictions_url) }
        format.xml  { render :xml => @conviction, :status => :created, :location => @conviction }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @conviction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /convictions/1
  # PUT /convictions/1.xml
  def update
    @conviction = Conviction.find(params[:id])

    respond_to do |format|
      if @conviction.update_attributes(params[:conviction])
        flash[:notice] = 'Conviction was successfully updated.'
        format.html { redirect_to(convictions_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @conviction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /convictions/1
  # DELETE /convictions/1.xml
  def destroy
    @conviction = Conviction.find(params[:id])
    @conviction.destroy

    respond_to do |format|
      format.html { redirect_to(convictions_url) }
      format.xml  { head :ok }
    end
  end
end
