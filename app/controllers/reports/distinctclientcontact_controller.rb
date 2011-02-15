class Reports::DistinctclientcontactController < ApplicationController
  layout 'reports'
  
  def index
    @disclientcontact=Contact.find(:all,:select => 'DISTINCT client_id, monthname(created_at) created_at1',:conditions=>["created_at>=? and created_at>=?",Time.local(Time.now.year,1,1),'2011-01-16'])

    @disclientcontact_months=@disclientcontact.group_by { |m| m.created_at1}
    
    respond_to do |format|
      format.html
      format.xml
    end
  end
  
  def show
    render :index
  end
end
