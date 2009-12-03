# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # AuthenticatedSystem must be included for RoleRequirement, and is provided by installing acts_as_authenticates and running 'script/generate authenticated account user'.
  include AuthenticatedSystem
  
  # You can move this into a different controller, if you wish.  This module gives you the require_role helpers, and others.
  include RoleRequirementSystem

  # Adds user names on create and delete for models that have t.userstamps included in migration
  include Userstamp

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  #common method for most controllers
  def get_client
    @client = Client.find(params[:client_id]) unless params[:client_id].nil?
    @alerts = @client.contacts.find( :all, :conditions=>"alert = true" ) unless @client.nil?
  end
  
  after_filter :store_location, :only => [:index, :new, :show, :edit]
  
  def toggle_admin
    session[:show_admin].nil? ? session[:show_admin] = true : session[:show_admin] = !session[:show_admin]
    render :update do |page|
      page.visual_effect(:toggle_blind, :adminlinks, :duration => 0.5)
#      page.toggle 'adminup','admindown'
    end
  end
  
  layout proc{ |c| c.request.xhr? ? false : "references" }
  
  before_filter :check_session
  
  def check_session
    session[:jobs_section] = 'jobs' if session[:jobs_section].nil?
    session[:contacts_section] = 'contacts' if session[:contacts_section].nil?
    session[:infamy_section] = 'used_substances' if session[:infamy_section].nil?
  end
  
end
