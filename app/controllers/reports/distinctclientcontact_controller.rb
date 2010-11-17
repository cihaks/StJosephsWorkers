class Reports::DistinctclientcontactController < ApplicationController
  layout 'reports'
  
  def index
    @disclientcontact=Contact.find(:all,:select => 'DISTINCT Contacts.client_id, Contacts.created_at',:conditions=>["created_at>=?",Time.local(Time.now.year,1,1)])
#    puts "disclientcontact: "+@disclientcontact.length.to_s
    @disclientcontact_months=@disclientcontact.group_by { |m| m.created_at.beginning_of_month}
    
    respond_to do |format|
      format.html
      format.xml
    end
  end
  
  def show
    render :index
  end
end
