class Reports::ClientcontactController < ApplicationController
  layout 'reports'
  
  def index
    @clientcontact=Contact.find(:all,:conditions=>["created_at>=? and created_at>=? and contact_type_id IN (?)",Time.local(Time.now.year,1,1),'2011-01-16','4,6'])
    puts "clientcontact: "+@clientcontact.length.to_s
    @clientcontact_months=@clientcontact.group_by { |m| m.created_at.beginning_of_month}
    
    respond_to do |format|
      format.html
      format.xml
    end
  end
  
  def show
    render :index
  end
end
