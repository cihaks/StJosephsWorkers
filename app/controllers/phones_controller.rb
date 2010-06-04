class PhonesController < ApplicationController
  layout 'contacts_content'
  
  ajax_updates do |config|
    config.refresh_element 'contacts-element'
  end
  
  before_filter :get_client, :set_section
  
  def set_section
    session[:contacts_section] = controller_name
  end
end
