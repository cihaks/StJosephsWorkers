class StatusTypesController < SecurityController
  layout 'references'
  
  # active_scaffold :status_type do |config|
  #   config.label = 'Status Types'
  #   config.columns = [:name, :description]
  # end

  # GET /status_types
  # GET /status_types.xml
  def index
    @status_types = StatusType.search(params[:query],params[:page],current_user.page_limit)

    respond_to do |format|
      format.html # index.html.erb
      format.js { render :layout=>false }
      format.xml  { render :xml => @status_types }
    end
  end

  # GET /status_types/1
  # GET /status_types/1.xml
  def show
    @status_type = StatusType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @status_type }
    end
  end

  # GET /status_types/new
  # GET /status_types/new.xml
  def new
    @status_type = StatusType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @status_type }
    end
  end

  # GET /status_types/1/edit
  def edit
    @status_type = StatusType.find(params[:id])
  end

  # POST /status_types
  # POST /status_types.xml
  def create
    @status_type = StatusType.new(params[:status_type])

    respond_to do |format|
      if @status_type.save
        flash[:notice] = 'StatusType was successfully created.'
        format.html { redirect_to(status_types_url) }
        format.xml  { render :xml => @status_type, :status => :created, :location => @status_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @status_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /status_types/1
  # PUT /status_types/1.xml
  def update
    @status_type = StatusType.find(params[:id])

    respond_to do |format|
      if @status_type.update_attributes(params[:status_type])
        flash[:notice] = 'StatusType was successfully updated.'
        format.html { redirect_to(status_types_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @status_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /status_types/1
  # DELETE /status_types/1.xml
  def destroy
    @status_type = StatusType.find(params[:id])
    @status_type.destroy

    respond_to do |format|
      format.html { redirect_to(status_types_url) }
      format.xml  { head :ok }
    end
  end
end
