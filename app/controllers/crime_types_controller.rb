class CrimeTypesController < SecurityController
  layout 'references'
  
  # GET /crime_types
  # GET /crime_types.xml
  # inherited from SecurityController

  # GET /crime_types/1
  # GET /crime_types/1.xml
  def show
    @crime_type = CrimeType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @crime_type }
    end
  end

  # GET /crime_types/new
  # GET /crime_types/new.xml
  def new
    @crime_type = CrimeType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @crime_type }
    end
  end

  # GET /crime_types/1/edit
  def edit
    @crime_type = CrimeType.find(params[:id])
  end

  # POST /crime_types
  # POST /crime_types.xml
  def create
    @crime_type = CrimeType.new(params[:crime_type])

    respond_to do |format|
      if @crime_type.save
        flash[:notice] = 'CrimeType was successfully created.'
        format.html { redirect_to(crime_types_path) }
        format.xml  { render :xml => @crime_type, :status => :created, :location => @crime_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @crime_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /crime_types/1
  # PUT /crime_types/1.xml
  def update
    @crime_type = CrimeType.find(params[:id])

    respond_to do |format|
      if @crime_type.update_attributes(params[:crime_type])
        flash[:notice] = 'CrimeType was successfully updated.'
        format.html { redirect_to(crime_types_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @crime_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /crime_types/1
  # DELETE /crime_types/1.xml
  def destroy
    @crime_type = CrimeType.find(params[:id])
    @crime_type.destroy

    respond_to do |format|
      format.html { redirect_to(crime_types_url) }
      format.xml  { head :ok }
    end
  end
end
