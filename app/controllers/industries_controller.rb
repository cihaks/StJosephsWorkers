class IndustriesController < SecurityController
  layout 'references'
  
  # GET /industries
  # GET /industries.xml
  # inherited from SecurityController

  # GET /industries/1
  # GET /industries/1.xml
  def show
    @industry = Industry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @industry }
    end
  end

  # GET /industries/new
  # GET /industries/new.xml
  def new
    @industry = Industry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @industry }
    end
  end

  # GET /industries/1/edit
  def edit
    @industry = Industry.find(params[:id])
  end

  # POST /industries
  # POST /industries.xml
  def create
    @industry = Industry.new(params[:industry])

    respond_to do |format|
      if @industry.save
        flash[:notice] = 'Industry was successfully created.'
        format.html { redirect_to(industries_url) }
        format.xml  { render :xml => @industry, :status => :created, :location => @industry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @industry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /industries/1
  # PUT /industries/1.xml
  def update
    @industry = Industry.find(params[:id])

    respond_to do |format|
      if @industry.update_attributes(params[:industry])
        flash[:notice] = 'Industry was successfully updated.'
        format.html { redirect_to(industries_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @industry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /industries/1
  # DELETE /industries/1.xml
  def destroy
    @industry = Industry.find(params[:id])
    @industry.destroy

    respond_to do |format|
      format.html { redirect_to(industries_url) }
      format.xml  { head :ok }
    end
  end
end
