class Reports::DistinctDetailController < ApplicationController
    layout 'reports'

    def index
      @disclientd=Contact.find(:all,:select => 'DISTINCT client_id, monthname(created_at) created_at1, month(created_at) mmonth',:conditions=>["created_at>=? and created_at>=? and contact_type_id IN (?)",Time.local(Time.now.year,1,1),'2011-01-16','4,5,6'])

      @disclientdetail=@disclientd.sort_by { |m| [m.mmonth , m.client.name]}
    
    
      respond_to do |format|
        format.html
        format.xml
      end
    end

    def show
      render :index
    end
  end
