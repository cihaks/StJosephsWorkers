class Reports::SuccessesController < ApplicationController
    layout 'reports'

    def index
      
			status_type = StatusType.find(:first, :conditions=>['name like ?','%ucces%'])
					
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
