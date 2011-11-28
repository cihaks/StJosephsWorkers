class Reports::ClientcontactController < ApplicationController
  layout 'reports'
  
  def index
	  @title = "All Client Contacts Report"
		@tabular = params[:tabular] unless params[:tabular].nil?
		
		#get dates from parameters
		from_date = params[:from_date].nil? || params[:from_date].length == 0 ? Date.today.beginning_of_year : Date.strptime(params[:from_date], '%m/%d/%Y')
		to_date = params[:to_date].nil? || params[:to_date].length == 0 ? Date.today : Date.strptime(params[:to_date], '%m/%d/%Y')
		
		if from_date <= Date.strptime('1/16/2011', '%m/%d/%Y')
			from_date = Date.strptime('1/17/2011', '%m/%d/%Y')
			params[:from_date] = from_date.strftime('%m/%d/%Y')
		end
		
		if to_date < from_date
			to_date = from_date
			params[:to_date] = to_date.strftime('%m/%d/%Y')
		end
		params[:from_date] = from_date
		params[:to_date] = to_date
		
		#get contact types to report on
		contact_types = params[:contact_types].nil? ? "" : params[:contact_types].join(",")
		
		conditions = "contact_date between '#{from_date.to_s}' and '#{to_date.to_s}'"
		if contact_types.length > 0
			conditions << " and contact_type_id in (#{contact_types})"
		end
		
    @clientcontact=Contact.find(:all,:conditions=>[conditions])
    puts "clientcontact: "+@clientcontact.length.to_s
    @clientcontact_months=@clientcontact.group_by { |m| m.contact_date.beginning_of_month}
    
    respond_to do |format|
      format.html
      format.xml
    end
  end
  
  def show
    render :index
  end
end
