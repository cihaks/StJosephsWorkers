class Reports::ReportsController < ApplicationController
  layout 'reports'

  before_filter :set_reports, :set_section
  
  require_role :admin
    
	def index
	end
	
	def set_section
    session[:client_report_section] = "reports"
  end
	
  def set_reports
    @reports_flag = true
  end
end
