class Reports::ClientsByStatusesController < ApplicationController
	layout 'reports'

  def index
		@tabular = params[:tabular] unless params[:tabular].nil?
	
		#get status types
		@status_types = []
		params[:status_types].each do |status_type_id|
			@status_types << StatusType.find(status_type_id.to_i)
		end unless params[:status_types].nil?
		
		#get dates from parameters
		from_date = params[:from_date].nil? || params[:from_date].length == 0 ? Date.today.beginning_of_year : Date.strptime(params[:from_date], '%m/%d/%Y')
		to_date = params[:to_date].nil? || params[:to_date].length == 0 ? Date.today : Date.strptime(params[:to_date], '%m/%d/%Y')
		
		if to_date < from_date
			to_date = from_date
		end
		params[:from_date] = from_date.strftime('%m/%d/%Y')
		params[:to_date] = to_date.strftime('%m/%d/%Y')
		
		results = AssignedStatusType.find(:all, :conditions=>['status_type_id in (?) and assigned_status_types.start_date >= ? and assigned_status_types.start_date <= ?', 
			             @status_types.collect(&:id),from_date,to_date])
		
		@results_by_month = results.group_by { |r| r.start_date.beginning_of_month }
		
		respond_to do |format|
      format.html
      format.xml
    end
  end

  def show
    render :index
  end
end
