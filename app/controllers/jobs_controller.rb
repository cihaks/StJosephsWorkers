class JobsController < ApplicationController
  layout "jobs_content"
  
  ajax_updates do |config|
    config.refresh_element 'jobs-element'
  end
  
  before_filter :get_client, :set_section
  
  def new_callback
    @job.job_rates.build
  end
  
  def set_section
    session[:jobs_section] = controller_name
  end
  
end
