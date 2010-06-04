class UsersController < SecurityController
  layout 'references'
  
  # render index.rhmtl
  def index
    @users = User.search(params[:query],params[:page],current_user.page_limit)
    
    respond_to do |format|
      format.html
      format.js { render :layout=>false }
      format.xml { render :xml => @users }
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  # render new.rhtml
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
 
  def create
    #logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      #self.current_user = @user # !! now logged in
      #redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
      redirect_to(users_path)
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin."
      render :action => 'new'
    end
  end
  
  def update
    params[:user][:role_ids] ||= [] if current_user.has_role? "admin"
    
    @user = User.find_by_login(params[:user][:login])
    success = @user && @user.update_attributes(params[:user])
    if success && @user.errors.empty?
      #self.current_user = @user
      flash[:notice] = "User account has been updated"
      redirect_to(users_path)
    else
      flash[:error] = "Errors updating account"
      render :action=>'edit'
    end
  end
  
  # DELETE /states/1
  # DELETE /states/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_path) }
      format.xml  { head :ok }
    end
  end
end
