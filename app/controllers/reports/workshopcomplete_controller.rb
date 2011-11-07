class Reports::WorkshopcompleteController < ApplicationController
  layout 'reports'
  
  def index
  @workshopcomplete=RegisteredClass.find(:all,:include=>:scheduled_course, :conditions=>["completed=0 and scheduled_courses.course_date>=?",Time.local(Time.now.year,1,1)])
  @workshopcomplete_months=@workshopcomplete.group_by { |m| m.scheduled_course.course_date.beginning_of_month}

 
    respond_to do |format|
      format.html
      format.xml
    end
  end
  
  def show
    render :index
  end
end

