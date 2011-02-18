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
    
		respond_to do |format|
	    if @profile && @profile.update_attributes(params[:user])
	      flash[:notice] = 'Profile was successfully updated.'
	      format.html { redirect_to( edit_profile_path(@profile) ) }
	      format.xml  { head :ok }
	    else
				@errors = @profile.errors
	      format.html { render :template => "users/profile" }
	      format.xml  { render :xml => @errors, :status => :unprocessable_entity }
				format.js do
					render :update do |page|
						@errors.collect do |e, m|
				      page.replace_html e+"-error", :text=>"  "+m unless e.nil? or m.nil?
				    end
					end
				end
	    end
	  end
  end
end
