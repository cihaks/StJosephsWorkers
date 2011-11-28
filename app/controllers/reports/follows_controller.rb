class Reports::FollowsController < ApplicationController
    layout 'reports'

    def index
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
			
			#get contact types to report on
			contact_types = params[:contact_types].nil? ? "" : params[:contact_types].join(",")
			
			if contact_types.length > 0
				contact_type_condition = "contact_type_id in (#{contact_types})"
			end
			
			contact_date_condition = "contact_date between '#{from_date.to_s}' and '#{to_date.to_s}'"
			
			@status_types = []
			params[:status_types].each do |status_type_id|
				@status_types << StatusType.find(status_type_id.to_i)
			end unless params[:status_types].nil?
			
			# build the sql
			table_code_orig = "a"
			table_code = table_code_orig
			sql = "select DATE_FORMAT(a.contact_date, '%M %d, %Y') as contact_date, all_contacts "
			# add columns for each status type selected
			@status_types.each do |status_type|
				sql << ", ifnull(#{status_type.name.delete(' ').underscore}_contacts,0) as #{status_type.name.delete(' ').underscore}_contacts "
			end
			sql << "from (select count(*) as all_contacts, contact_date from contacts where #{contact_date_condition} "
			sql << "and #{contact_type_condition} " unless contact_type_condition.nil?
			sql << "group by contact_date) #{table_code_orig} "
			
			@status_types.each do |status_type|
				#get follow up count
				table_code = table_code.next
				sql << "left outer join "
				sql << "(select count(*) as #{status_type.name.delete(' ').underscore}_contacts, contact_date from contacts where #{contact_date_condition} "
				sql << "and #{contact_type_condition} " unless contact_type_condition.nil?
				sql << "and client_id in (select client_id from assigned_status_types where status_type_id=#{status_type.id} and start_date between '#{from_date.to_s}' and '#{to_date.to_s}' and (end_date >= '#{from_date.to_s}' or end_date is null)) "
				sql << "group by contact_date) #{table_code} "
				#finish outer join statement
				sql << "on #{table_code_orig}.contact_date=#{table_code}.contact_date "
			end
  		
			@follows=Contact.find_by_sql(sql)

      respond_to do |format|
        format.html
        format.xml
      end
    end

    def show
      render :index
    end

  end