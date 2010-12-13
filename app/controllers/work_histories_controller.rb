class WorkHistoriesController < SecurityController
  # layout 'references'
  # # GET /work_histories
  # # GET /work_histories.xml
  # def index
  #   @work_histories = WorkHistory.search(params[:query],params[:page],current_user.page_limit)
  # 
  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.js { render :layout => false}
  #     format.xml  { render :xml => @work_histories }
  #   end
  # end
  # 
  # # GET /work_histories/1
  # # GET /work_histories/1.xml
  # def show
  #   @work_history = WorkHistory.find(params[:id])
  # 
  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.xml  { render :xml => @work_history }
  #   end
  # end
  # 
  # # GET /work_histories/new
  # # GET /work_histories/new.xml
  # def new
  #   @work_history = WorkHistory.new
  # 
  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.xml  { render :xml => @work_history }
  #   end
  # end
  # 
  # # GET /work_histories/1/edit
  # def edit
  #   @work_history = WorkHistory.find(params[:id])
  # end
  # 
  # # POST /work_histories
  # # POST /work_histories.xml
  # def create
  #   @work_history = WorkHistory.new(params[:work_history])
  # 
  #   respond_to do |format|
  #     if @work_history.save
  #       format.html { redirect_to(work_histories_url) }
  #       format.xml  { render :xml => @work_history, :status => :created, :location => @work_history }
  #     else
  #       format.html { render :action => "new" }
  #       format.xml  { render :xml => @work_history.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end
  # 
  # # PUT /work_histories/1
  # # PUT /work_histories/1.xml
  # def update
  #   @work_history = WorkHistory.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @work_history.update_attributes(params[:work_history])
  #       format.html { redirect_to(work_histories_url, :notice => 'WorkHistory was successfully updated.') }
  #       format.xml  { head :ok }
  #     else
  #       format.html { render :action => "edit" }
  #       format.xml  { render :xml => @work_history.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end
  # 
  # # DELETE /work_histories/1
  # # DELETE /work_histories/1.xml
  # def destroy
  #   @work_history = WorkHistory.find(params[:id])
  #   @work_history.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to(work_histories_url) }
  #     format.xml  { head :ok }
  #   end
  # end
end
