class ConvertRegisteredClasses < ActiveRecord::Migration
  def self.up
		RegisteredClass.all.each do |old_class|
			new_class = ScheduledCourse.find(:first, :conditions=>["course_id = ? and course_date between ? and ?", old_class.course_id, old_class.class_date.to_time, old_class.class_date.to_time+1.day])
			unless new_class
				new_class = ScheduledCourse.create(:course_id => old_class.course_id, :course_date => old_class.class_date)
			end
			old_class.scheduled_course_id = new_class.id
			old_class.save
		end
  end

  def self.down
		RegisteredClass.all.each do |old_class|
			old_class.course_id = old_class.scheduled_class.course_id if old_class.scheduled_class
			old_class.class_date = old_class.scheduled_class.course_date if old_class.scheduled_class
			old_class.save
		end
  end
end
