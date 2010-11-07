class UsersController < SecurityController
  layout 'references'
  
  # render index.rhmtl
  # inherited from SecurityController
  
  def show
    @user_obj = User.find(params[:id])
  end
  
  # render new.rhtml
  def new
    @user_obj = User.new
  end
  
  def edit
    @user_obj = User.find(params[:id])
  end
 
  def create
    #logout_keeping_session!
    @user_obj = User.new(params[:user])
    success = @user_obj && @user_obj.save
    if success && @user_obj.errors.empty?
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
    
    @user_obj = User.find_by_login(params[:user][:login])
    success = @user_obj && @user_obj.update_attributes(params[:user])
    if success && @user_obj.errors.empty?
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
    @user_obj = User.find(params[:id])
    @user_obj.destroy

    respond_to do |format|
      format.html { redirect_to(users_path) }
      format.xml  { head :ok }
    end
  end
end
