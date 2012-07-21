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
  # def create
  #   @scheduled_course = ScheduledCourse.new(params[:scheduled_course])
  # 		
  # 		# sample params {"start_date"=>"07/30/2012", 
  # 		# 								"occurrences"=>"5", 
  # 		# 								"scheduled_course"=>{"location"=>"", "teacher"=>"", "capacity"=>"4", "course_id"=>"3"}, 
  # 		# 								"weekly_on"=>"Monday", 
  # 		# 								"frequency"=>"weekly", 
  # 		# 								"monthly_on"=>"1", 
  # 		# 								"start_time"=>{"minute"=>"16", "hour"=>"12"}}
  # 		
  # 		#determine if weekly or monthly
  # 		if params[:frequency] == 'weekly'
  # 			#if week day, is startdate on same day of the week
  # 			
  # 		elsif params[:frequency] == 'biweekly'
  # 			#if week day, is startdate on same day of the week
  # 			
  # 		elsif params[:frequency] == 'monthly'
  # 			#if month day, is start date a match
  # 			
  # 		end
  # 
  # 		#determine frequency and create as many instances as needed
  # 			#combine date and start time
  # 			#suggestion:  create array of dates with start time and loop through to create all instances
  # 			
  # 		#save all instances within a transaction
  #     # e.g. ScheduledCourse.transaction do ... end
  # 
  #   respond_to do |format|
  #     if @scheduled_course.save
  #       format.html { redirect_to(@scheduled_course, :notice => 'ScheduledCourse was successfully created.') }
  #       format.xml  { render :xml => @scheduled_course, :status => :created, :location => @scheduled_course }
  #     else
  #       format.html { render :action => "new" }
  #       format.xml  { render :xml => @scheduled_course.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end
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
