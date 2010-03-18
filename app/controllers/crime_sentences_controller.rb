class CrimeSentencesController < ApplicationController
  layout 'infamy_content'
  
  ajax_updates do |config|
    config.refresh_element 'infamy-element'
  end
  
  before_filter :get_client, :set_section

  def update_callback_before_object
    params[:crime_sentence][:crime_type_ids] ||= []
  end
  
  def set_section
    session[:infamy_section] = controller_name
  end
end
