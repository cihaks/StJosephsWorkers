# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # AuthenticatedSystem must be included for RoleRequirement, and is provided by installing acts_as_authenticates and running 'script/generate authenticated account user'.
  include AuthenticatedSystem
  
  # You can move this into a different controller, if you wish.  This module gives you the require_role helpers, and others.
  include RoleRequirementSystem

  # Adds user names on create and delete for models that have t.userstamps included in migration
  include Userstamp

	# Add SSL capabilities
	include SslRequirement

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  #set default layout for non-ajax calls
  layout proc{ |c| c.request.xhr? ? false : "references" }
  
  before_filter :check_session, :no_cache, :set_locale
  after_filter :store_location, :only => [:index, :new, :show, :edit]
  # after_filter :update_activity_list, :only => [:create, :update, :destroy]
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
	def set_locale
	  I18n.locale = params[:locale]
	end

  def toggle_admin
    session[:show_admin].nil? ? session[:show_admin] = true : session[:show_admin] = !session[:show_admin]
    render :update do |page|
      page.visual_effect(:toggle_blind, :adminlinks, :duration => 0.5)
#      page.toggle 'adminup','admindown'
    end
  end
  
  def check_session
    session[:jobs_section] = 'jobs' if session[:jobs_section].nil?
    session[:contacts_section] = 'contacts' if session[:contacts_section].nil?
    session[:infamy_section] = 'assigned_agencies' if session[:infamy_section].nil?
  end
  
  #fixes issue with IE cache and page updates
  def no_cache
    response.headers["Expires"] = '0'
    # HTTP 1.0
    response.headers["Pragma"] = "no-cache"
    # HTTP 1.1 'pre-check=0, post-check=0' (IE specific)
    response.headers["Cache-Control"] = 'no-store, no-cache, must-revalidate, max-age=0, pre-check=0, post-check=0'
  end
  
end
