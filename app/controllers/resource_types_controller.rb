class ResourceTypesController < SecurityController
  # layout 'references'
  # 
  # # GET /resource_types
  # # GET /resource_types.xml
  # # inherited from SecurityController
  # 
  # # GET /resource_types/1
  # # GET /resource_types/1.xml
  # def show
  #   @resource_type = ResourceType.find(params[:id])
  # 
  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.xml  { render :xml => @resource_type }
  #   end
  # end
  # 
  # # GET /resource_types/new
  # # GET /resource_types/new.xml
  # def new
  #   @resource_type = ResourceType.new
  # 
  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.xml  { render :xml => @resource_type }
  #   end
  # end
  # 
  # # GET /resource_types/1/edit
  # def edit
  #   @resource_type = ResourceType.find(params[:id])
  # end
  # 
  # # POST /resource_types
  # # POST /resource_types.xml
  # def create
  #   @resource_type = ResourceType.new(params[:resource_type])
  # 
  #   respond_to do |format|
  #     if @resource_type.save
  #       flash[:notice] = 'ResourceType was successfully created.'
  #       format.html { redirect_to(resource_types_url) }
  #       format.xml  { render :xml => @resource_type, :status => :created, :location => @resource_type }
  #     else
  #       format.html { render :action => "new" }
  #       format.xml  { render :xml => @resource_type.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end
  # 
  # # PUT /resource_types/1
  # # PUT /resource_types/1.xml
  # def update
  #   @resource_type = ResourceType.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @resource_type.update_attributes(params[:resource_type])
  #       flash[:notice] = 'ResourceType was successfully updated.'
  #       format.html { redirect_to(resource_types_url) }
  #       format.xml  { head :ok }
  #     else
  #       format.html { render :action => "edit" }
  #       format.xml  { render :xml => @resource_type.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end
  # 
  # # DELETE /resource_types/1
  # # DELETE /resource_types/1.xml
  # def destroy
  #   @resource_type = ResourceType.find(params[:id])
  #   @resource_type.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to(resource_types_url) }
  #     format.xml  { head :ok }
  #   end
  # end
end
