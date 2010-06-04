class UsedSubstancesController < ApplicationController
  layout 'infamy_content'
  
  ajax_updates do |config|
    config.refresh_element 'infamy-element'
  end
  
  before_filter :get_client, :set_section
  
  def set_section
    session[:infamy_section] = controller_name
  end

end
