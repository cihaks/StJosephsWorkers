class CourseAttendancesController < ApplicationController
	layout "reports"
	
	def index
		my_action
	end
	
	def create
		my_action
		respond_to do |format|
      format.js # { render :layout=>false }  # need to have option to not use layout contacts?
      format.html { render :action => :index } 
      format.xml  { render :xml => @contacts }
    end
	end
	
	def my_action
		@course_search = CourseSearch.new(params[:course_search]) 
		@course_search.validate
		@attendances = RegisteredClass.find(:all, :conditions=>[ "course_id = ? and class_date between ? and ? ", 
																													   @course_search.course_id, 
																													   @course_search.from_date, 
																													   @course_search.to_date ] )
	end
	
	def update
    
    @object_to_update = RegisteredClass.find(params[:id])
    
    respond_to do |format|
      if @object_to_update.update_attributes(params[:registered_class])
        
        flash[:notice] = 'Registered Class was successfully updated.'
        format.html { redirect_to( course_attendances_path() )}
        format.xml  { head :ok }
        format.js do
          render :update do |page|
	          page.replace_html 'attendance-1', :partial=>'course_attendances/attendance', :object => @object_to_update
          end
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @object_to_update.errors, :status => :unprocessable_entity }
      end
    end
  end
	
end
