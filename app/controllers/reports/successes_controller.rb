class Reports::SuccessesController < ApplicationController
    layout 'reports'

    def index
#      @clients=Client.find_by_sql("select first_name, last_name from clients a, clients_status_types b where a.id=b.client_id
#      and b.status_type_id=15")

      @clients=StatusType.find(15).clients.paginate :per_page=>current_user.page_limit, :page=>params[:page], :order => 'last_name, first_name, middle_name'		
      @office_visit = ContactType.find(:first, :conditions => ['name like ?','Office Visit%'])

      

      respond_to do |format|
#         format.html   
        format.html {render 'clients/index'}
        format.xml
      end
    end

    def show
      render :index
    end
  end
