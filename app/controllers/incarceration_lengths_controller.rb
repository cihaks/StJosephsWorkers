class IncarcerationLengthsController < SecurityController
  layout 'references'
  
  # GET /incarceration_lengths
  # GET /incarceration_lengths.xml
  # inherited from SecurityController

  # GET /incarceration_lengths/1
  # GET /incarceration_lengths/1.xml
  def show
    @incarceration_length = IncarcerationLength.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @incarceration_length }
    end
  end

  # GET /incarceration_lengths/new
  # GET /incarceration_lengths/new.xml
  def new
    @incarceration_length = IncarcerationLength.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @incarceration_length }
    end
  end

  # GET /incarceration_lengths/1/edit
  def edit
    @incarceration_length = IncarcerationLength.find(params[:id])
  end

  # POST /incarceration_lengths
  # POST /incarceration_lengths.xml
  def create
    @incarceration_length = IncarcerationLength.new(params[:incarceration_length])

    respond_to do |format|
      if @incarceration_length.save
        flash[:notice] = 'IncarcerationLength was successfully created.'
        format.html { redirect_to(incarceration_lengths_url) }
        format.xml  { render :xml => @incarceration_length, :status => :created, :location => @incarceration_length }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @incarceration_length.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /incarceration_lengths/1
  # PUT /incarceration_lengths/1.xml
  def update
    @incarceration_length = IncarcerationLength.find(params[:id])

    respond_to do |format|
      if @incarceration_length.update_attributes(params[:incarceration_length])
        flash[:notice] = 'IncarcerationLength was successfully updated.'
        format.html { redirect_to(incarceration_lengths_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @incarceration_length.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /incarceration_lengths/1
  # DELETE /incarceration_lengths/1.xml
  def destroy
    @incarceration_length = IncarcerationLength.find(params[:id])
    @incarceration_length.destroy

    respond_to do |format|
      format.html { redirect_to(incarceration_lengths_url) }
      format.xml  { head :ok }
    end
  end
end
