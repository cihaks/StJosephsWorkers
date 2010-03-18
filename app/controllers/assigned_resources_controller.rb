class AssignedResourcesController < ApplicationController
  layout 'contacts_content'
  
  ajax_updates do |config|
    config.refresh_element 'contacts-element'
  end
  
  before_filter :get_client, :set_section
  
  def new_callback
    get_keys
  end
  
  def edit_callback
    get_keys
  end
  
  def create_callback_before_object
    set_domain_association
  end
  
  def update_callback_before_object
    set_domain_association if !params[:assigned_resource].nil? and !params[:assigned_resource][:resource_type_id].nil? # update includes resource type 
  end
  
  def set_section
    session[:contacts_section] = controller_name
  end
  
	# figure out how to put these in the acts_as_domain_association plugin (generator?)
  def get_keys
    @daily_pass_key = ResourceType.find(:first, :conditions=>["name like ?","%Daily Pass%"])
    @monthly_pass_key = ResourceType.find(:first, :conditions=>["name like ?","%Monthly Pass%"])
    @voice_mail_key = ResourceType.find(:first, :conditions=>["name like ?","%CVM%"])
  end
  
  def set_domain_association
    get_keys
    case params[:assigned_resource][:resource_type_id]
      when @daily_pass_key.id.to_s
        params[:assigned_resource][:my_daily_pass] ||= {}
        params[:assigned_resource][:my_monthly_pass] = nil
        params[:assigned_resource][:my_voice_mail] = nil
      when @monthly_pass_key.id.to_s
        params[:assigned_resource][:my_monthly_pass] ||= {}
        params[:assigned_resource][:my_daily_pass] = nil
        params[:assigned_resource][:my_voice_mail] = nil
      when @voice_mail_key.id.to_s
        params[:assigned_resource][:my_voice_mail] ||= {}
        params[:assigned_resource][:my_daily_pass] = nil
        params[:assigned_resource][:my_monthly_pass] = nil
			else
				params[:assigned_resource][:my_daily_pass] = nil
        params[:assigned_resource][:my_monthly_pass] = nil
        params[:assigned_resource][:my_voice_mail] = nil
    end
  end
end
