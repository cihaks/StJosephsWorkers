class Reports::OverfillClassController < ApplicationController
  layout 'reports'

  def index

@overfill=RegisteredClass.find_by_sql(["select count(*) as class_count, class_date from registered_classes where created_at>=? 
   group by class_date having count(*) >= 12",Time.local(Time.now.year,1,1)])

    respond_to do |format|
      format.html
      format.xml
    end
  end

  def show
    render :index
  end
end