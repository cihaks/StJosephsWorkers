class SubstancesController < SecurityController
  layout 'references'
  
  # active_scaffold :substance do |config|
  #   config.columns = [:name]
  # end

  # GET /substances
  # GET /substances.xml
  def index
    @substances = Substance.search(params[:query],params[:page],current_user.page_limit)

    respond_to do |format|
      format.html # index.html.erb
      format.js { render :layout=>false }
      format.xml  { render :xml => @substances }
    end
  end

  # GET /substances/1
  # GET /substances/1.xml
  def show
    @substance = Substance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @substance }
    end
  end

  # GET /substances/new
  # GET /substances/new.xml
  def new
    @substance = Substance.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @substance }
    end
  end

  # GET /substances/1/edit
  def edit
    @substance = Substance.find(params[:id])
  end

  # POST /substances
  # POST /substances.xml
  def create
    @substance = Substance.new(params[:substance])

    respond_to do |format|
      if @substance.save
        flash[:notice] = 'Substance was successfully created.'
        format.html { redirect_to(substances_url) }
        format.xml  { render :xml => @substance, :status => :created, :location => @substance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @substance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /substances/1
  # PUT /substances/1.xml
  def update
    @substance = Substance.find(params[:id])

    respond_to do |format|
      if @substance.update_attributes(params[:substance])
        flash[:notice] = 'Substance was successfully updated.'
        format.html { redirect_to(substances_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @substance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /substances/1
  # DELETE /substances/1.xml
  def destroy
    @substance = Substance.find(params[:id])
    @substance.destroy

    respond_to do |format|
      format.html { redirect_to(substances_url) }
      format.xml  { head :ok }
    end
  end
end
