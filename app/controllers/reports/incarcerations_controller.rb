class Reports::IncarcerationsController < ApplicationController
  layout 'reports'
  
  def index
    # @incarcerations=CrimeSentence.find(:all,:conditions=>["created_at>=?",Time.local(Time.now.year,1,1)])
    # puts "incarcerations: "+@incarcerations.length.to_s
    # @incarcerations_months=@incarcerations.group_by { |m| m.created_at.beginning_of_month}
		status_type = StatusType.find(:first, :conditions=>['name like ?','%ncarcera%'])
				
    @clients=Client.search_status(status_type, params[:page], current_user.page_limit)
		
		@office_visit = ContactType.find(:first, :conditions => ['name like ?','Office Visit%'])

    respond_to do |format|
      format.html { render 'clients/index' }
			format.js { render 'clients/index', :layout=>false }
      format.xml 
    end
  end
  
  def show
    render :index
  end
end
