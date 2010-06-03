class AssignedResourcesController < ApplicationController
  layout 'contacts_content'
  
  ajax_updates do |config|
    config.refresh_element 'contacts-element'
  end
  
  before_filter :get_client, :set_section
	
  def create_callback_before_object
    set_domain_association
  end
  
  def update_callback_before_object
	  set_domain_association if !params[:assigned_resource].nil? and !params[:assigned_resource][:resource_type_id].nil? # update includes resource type 
  end

  def set_section
    session[:contacts_section] = controller_name
  end
  
end
