class CrimeSentencesController < ApplicationController
  layout 'infamy_content'
  
  ajax_updates do |config|
    config.refresh_element 'infamy-element'
  end
  
  before_filter :get_client, :set_section

  def update_callback_before_object
		if params[:crime_sentence].size > 1
	    params[:crime_sentence][:crime_type_ids] ||= []
	    params[:crime_sentence][:conviction_ids] ||= []
    end
  end
  
	#TODO need to update status if not marked as previously incarcerated...

  def set_section
    session[:infamy_section] = controller_name
  end
end
