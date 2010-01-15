class PrisonsController < SecurityController
  layout 'references'
  
  # active_scaffold :prison do |config|
  #     config.columns = [:name]
  #   end

  # GET /prisons
  # GET /prisons.xml
  def index
    @prisons = Prison.search(params[:query],params[:page],current_user.page_limit)

    respond_to do |format|
      format.html # index.html.erb
      format.js { render :layout=>false }
      format.xml  { render :xml => @prisons }
    end
  end

  # GET /prisons/1
  # GET /prisons/1.xml
  def show
    @prison = Prison.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prison }
    end
  end

  # GET /prisons/new
  # GET /prisons/new.xml
  def new
    @prison = Prison.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prison }
    end
  end

  # GET /prisons/1/edit
  def edit
    @prison = Prison.find(params[:id])
  end

  # POST /prisons
  # POST /prisons.xml
  def create
    @prison = Prison.new(params[:prison])

    respond_to do |format|
      if @prison.save
        flash[:notice] = 'Prison was successfully created.'
        format.html { redirect_to(@prison) }
        format.xml  { render :xml => @prison, :status => :created, :location => @prison }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prison.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prisons/1
  # PUT /prisons/1.xml
  def update
    @prison = Prison.find(params[:id])

    respond_to do |format|
      if @prison.update_attributes(params[:prison])
        flash[:notice] = 'Prison was successfully updated.'
        format.html { redirect_to(@prison) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prison.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prisons/1
  # DELETE /prisons/1.xml
  def destroy
    @prison = Prison.find(params[:id])
    @prison.destroy

    respond_to do |format|
      format.html { redirect_to(prisons_url) }
      format.xml  { head :ok }
    end
  end
end
