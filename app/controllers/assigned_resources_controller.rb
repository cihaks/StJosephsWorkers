class AssignedResourcesController < ApplicationController
  layout 'jobs_content'
  
  ajax_updates do |config|
    config.refresh_element 'jobs-element'
  end
  
  before_filter :get_client, :set_section
	
	def new_callback
		@assigned_resource.resource_date = Time.now
		@assigned_resource.resource_type = ResourceType.find(:first)
		@assigned_resource.build_daily_pass
		@assigned_resource.build_monthly_pass
		@assigned_resource.build_voice_mail
		@assigned_resource.build_clothing
		@assigned_resource.build_hygiene
	end
	
  def create_callback_before_object
#    set_domain_association
  end
  
  def update_callback_before_object
#	  set_domain_association if !params[:assigned_resource].nil? and !params[:assigned_resource][:resource_type_id].nil? # update includes resource type 
  end

  def set_section
    session[:jobs_section] = controller_name
  end
  
end
#{assoc}.save if #{assoc} and \"#{assoc}\".downcase.eql?(#{configuration[:domain_type].to_s}.type_name.downcase)