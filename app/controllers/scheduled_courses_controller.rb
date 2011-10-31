class ScheduledCoursesController < SecurityController
  # # GET /scheduled_courses
  # # GET /scheduled_courses.xml
  # def index
  #   @scheduled_courses = ScheduledCourse.all
  # 
  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.xml  { render :xml => @scheduled_courses }
  #   end
  # end
  # 
  # # GET /scheduled_courses/1
  # # GET /scheduled_courses/1.xml
  # def show
  #   @scheduled_course = ScheduledCourse.find(params[:id])
  # 
  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.xml  { render :xml => @scheduled_course }
  #   end
  # end
  # 
  # # GET /scheduled_courses/new
  # # GET /scheduled_courses/new.xml
  # def new
  #   @scheduled_course = ScheduledCourse.new
  # 
  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.xml  { render :xml => @scheduled_course }
  #   end
  # end
  # 
  # # GET /scheduled_courses/1/edit
  # def edit
  #   @scheduled_course = ScheduledCourse.find(params[:id])
  # end
  # 
  # POST /scheduled_courses
  # POST /scheduled_courses.xml
  def create
		
		puts params
		{"occurrences"=>"4", 
			"scheduled_course"=>{"location"=>"", "teacher"=>"", "course_date"=>"08/01/2011 9:13 AM", "capacity"=>"10", "course_id"=>"3"}, 
			"weekly_on"=>"Tuesday", 
			"frequency"=>"weekly", 
			"monthly_on"=>"1"}
		
    # @scheduled_course = ScheduledCourse.new(params[:scheduled_course])
    #   
    # respond_to do |format|
    #   if @scheduled_course.save
    #     format.html { redirect_to(@scheduled_course, :notice => 'ScheduledCourse was successfully created.') }
    #     format.xml  { render :xml => @scheduled_course, :status => :created, :location => @scheduled_course }
    #   else
    #     format.html { render :action => "new" }
    #     format.xml  { render :xml => @scheduled_course.errors, :status => :unprocessable_entity }
    #   end
    # end
  end
  # 
  # # PUT /scheduled_courses/1
  # # PUT /scheduled_courses/1.xml
  # def update
  #   @scheduled_course = ScheduledCourse.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @scheduled_course.update_attributes(params[:scheduled_course])
  #       format.html { redirect_to(@scheduled_course, :notice => 'ScheduledCourse was successfully updated.') }
  #       format.xml  { head :ok }
  #     else
  #       format.html { render :action => "edit" }
  #       format.xml  { render :xml => @scheduled_course.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end
  # 
  # # DELETE /scheduled_courses/1
  # # DELETE /scheduled_courses/1.xml
  # def destroy
  #   @scheduled_course = ScheduledCourse.find(params[:id])
  #   @scheduled_course.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to(scheduled_courses_url) }
  #     format.xml  { head :ok }
  #   end
  # end
end
