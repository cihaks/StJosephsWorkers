class CourseAttendancesController < ApplicationController
	layout "reports"
	
	def index
		get_attendances
	end
	
	def create
		# this should allow for addition to course, not just display what is there
		get_attendances
		respond_to do |format|
      format.js # { render :layout=>false }  # need to have option to not use layout contacts?
      format.html { render :action => :index } 
      format.xml  { render :xml => @contacts }
    end
	end
		
	def update
    # this is really updating the registered class, not course_attendance

    @object_to_update = RegisteredClass.find(params[:id])
    
    respond_to do |format|
      if @object_to_update.update_attributes(params[:registered_class])
        
        flash[:notice] = 'Registered Class was successfully updated.'
        format.html { redirect_to( course_attendances_path() )}
        format.xml  { head :ok }
        format.js do
          render :update do |page|
	          page.replace_html 'attendance-'+@object_to_update.id.to_s, :partial=>'course_attendances/attendance', :object => @object_to_update
          end
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @object_to_update.errors, :status => :unprocessable_entity }
      end
    end
  end
	
	private
	
	def get_attendances
		@course_search = CourseSearch.new(params[:course_search]) 
		
		if @course_search.valid?
			from_date = @course_search.from_date unless @course_search.from_date.nil? or @course_search.from_date.blank?
			# from_date = Date.parse(from_date) if from_date
		
			to_date = @course_search.to_date unless @course_search.to_date.nil? or @course_search.to_date.blank?
			# to_date = Date.parse(to_date) if to_date
	  end
		
		if from_date and to_date
			conditions = ["course_id = ? and class_date between ? and ?", @course_search.course_id, from_date, to_date]
		else
			if from_date
				conditions = ["course_id = ? and class_date >= ?", @course_search.course_id, from_date]
			elsif to_date
				conditions = ["course_id = ? and class_date <= ?", @course_search.course_id, to_date]
			else
				conditions = ["course_id = ?", @course_search.course_id]
			end
		end
		
		@attendances = RegisteredClass.find(:all, :conditions=>conditions )
	end
	
	
	
end
