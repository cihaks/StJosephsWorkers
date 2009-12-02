class ProfilesController < ApplicationController
  layout 'references'
  
  require_role :admin, :except=>["show","edit","update"]
    
  def show
    @profile = User.find(params[:id])
    render :template=>"users/profile"
  end
  
  def edit
    @profile = User.find(params[:id])
    render :template=>"users/profile"
  end
  
  def update    
    @profile = User.find_by_login(params[:user][:login])
    success = @profile && @profile.update_attributes(params[:user])
    if success && @profile.errors.empty?
      flash[:notice] = "User account has been updated"
      redirect_to(edit_profile_path(@profile))
    else
      flash[:error] = "Errors updating account"
      render :action=>'edit'
    end
  end
end
