class BenefitsTypesController < SecurityController
  # layout 'references'
  # 
  # # GET /benefits_types
  # # GET /benefits_types.xml
  # # inherited from SecurityController
  # 
  # # GET /benefits_types/1
  # # GET /benefits_types/1.xml
  # def show
  #   @benefits_type = BenefitsType.find(params[:id])
  # 
  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.xml  { render :xml => @benefits_type }
  #   end
  # end
  # 
  # # GET /benefits_types/new
  # # GET /benefits_types/new.xml
  # def new
  #   @benefits_type = BenefitsType.new
  # 
  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.xml  { render :xml => @benefits_type }
  #   end
  # end
  # 
  # # GET /benefits_types/1/edit
  # def edit
  #   @benefits_type = BenefitsType.find(params[:id])
  # end
  # 
  # # POST /benefits_types
  # # POST /benefits_types.xml
  # def create
  #   @benefits_type = BenefitsType.new(params[:benefits_type])
  # 
  #   respond_to do |format|
  #     if @benefits_type.save
  #       flash[:notice] = 'BenefitsType was successfully created.'
  #       format.html { redirect_to(benefits_types_url) }
  #       format.xml  { render :xml => @benefits_type, :status => :created, :location => @benefits_type }
  #     else
  #       format.html { render :action => "new" }
  #       format.xml  { render :xml => @benefits_type.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end
  # 
  # # PUT /benefits_types/1
  # # PUT /benefits_types/1.xml
  # def update
  #   @benefits_type = BenefitsType.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @benefits_type.update_attributes(params[:benefits_type])
  #       flash[:notice] = 'BenefitsType was successfully updated.'
  #       format.html { redirect_to(benefits_types_url) }
  #       format.xml  { head :ok }
  #     else
  #       format.html { render :action => "edit" }
  #       format.xml  { render :xml => @benefits_type.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end
  # 
  # # DELETE /benefits_types/1
  # # DELETE /benefits_types/1.xml
  # def destroy
  #   @benefits_type = BenefitsType.find(params[:id])
  #   @benefits_type.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to(benefits_types_url) }
  #     format.xml  { head :ok }
  #   end
  # end
end
