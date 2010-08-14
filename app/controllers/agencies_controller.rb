class AgenciesController < SecurityController
  layout 'references'
  
  # GET /agencies
  # GET /agencies.xml
  # inherited from SecurityController

  # GET /agencies/1
  # GET /agencies/1.xml
  def show
    @agency = Agency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @agency }
    end
  end

  # GET /agencies/new
  # GET /agencies/new.xml
  def new
    @agency = Agency.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @agency }
    end
  end

  # GET /agencies/1/edit
  def edit
    @agency = Agency.find(params[:id])
  end

  # POST /agencies
  # POST /agencies.xml
  def create
    @agency = Agency.new(params[:agency])

    respond_to do |format|
      if @agency.save
        flash[:notice] = 'Agency was successfully created.'
        format.html { redirect_to(agencies_url) }
        format.xml  { render :xml => @agency, :status => :created, :location => @agency }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @agency.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /agencies/1
  # PUT /agencies/1.xml
  def update
    @agency = Agency.find(params[:id])

    respond_to do |format|
      if @agency.update_attributes(params[:agency])
        flash[:notice] = 'Agency was successfully updated.'
        format.html { redirect_to(agencies_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @agency.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /agencies/1
  # DELETE /agencies/1.xml
  def destroy
    @agency = Agency.find(params[:id])
    @agency.destroy

    respond_to do |format|
      format.html { redirect_to(agencies_url) }
      format.xml  { head :ok }
    end
  end
end
