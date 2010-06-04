class JobInterviewsController < ApplicationController
  layout 'jobs_content'
  
  ajax_updates do |config|
    config.refresh_element 'jobs-element'
  end
  
  before_filter :get_client
  before_filter :set_section
  
  def set_section
    session[:jobs_section] = "job_interviews"
  end
  
end
