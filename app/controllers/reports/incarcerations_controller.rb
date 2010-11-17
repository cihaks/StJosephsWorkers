class Reports::IncarcerationsController < ApplicationController
  layout 'reports'
  
  def index
    @incarcerations=CrimeSentence.find(:all,:conditions=>["created_at>=?",Time.local(Time.now.year,1,1)])
    puts "incarcerations: "+@incarcerations.length.to_s
    @incarcerations_months=@incarcerations.group_by { |m| m.created_at.beginning_of_month}
    
    respond_to do |format|
      format.html
      format.xml
    end
  end
  
  def show
    render :index
  end
end
