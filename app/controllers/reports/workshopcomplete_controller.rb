class Reports::WorkshopcompleteController < ApplicationController
  layout 'reports'
  
  def index
  @workshopcomplete=RegisteredClass.find(:all,:conditions=>["completed=0 and class_date>=?",Time.local(Time.now.year,1,1)])
  @workshopcomplete_months=@workshopcomplete.group_by { |m| m.class_date.beginning_of_month}

 
    respond_to do |format|
      format.html
      format.xml
    end
  end
  
  def show
    render :index
  end
end

