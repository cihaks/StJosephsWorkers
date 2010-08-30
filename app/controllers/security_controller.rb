class SecurityController < ApplicationController
  require_role :admin

	# GET method for sub-classed controllers
  def index
	  eval("@#{controller_name} = #{controller_name.classify}.search(params[:query],params[:page],current_user.admin_list_limit)")

    respond_to do |format|
      format.html # index.html.erb
      format.js { render :layout=>false }
      format.xml  { render :xml => eval("@#{controller_name}") }
    end
  end

end
