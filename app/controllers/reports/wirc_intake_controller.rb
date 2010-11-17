class Reports::WircIntakeController < ApplicationController
    layout 'reports'

    def index

  @wirc=Client.find_by_sql(["select b.* from clients a, clients_status_types b where a.id=b.client_id
    and b.status_type_id=16 and b.created_at>=?",Time.local(Time.now.year,1,1)])
  @wirc_months=@wirc.group_by { |m| m.created_at.beginning_of_month}


      respond_to do |format|
        format.html
        format.xml
      end
    end

    def show
      render :index
    end
  end
