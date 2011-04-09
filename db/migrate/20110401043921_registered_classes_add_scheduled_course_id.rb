class RegisteredClassesAddScheduledCourseId < ActiveRecord::Migration
  def self.up
		add_column :registered_classes, :scheduled_course_id, :integer		
  end

  def self.down
		remove_column :registered_classes, :scheduled_course_id
  end
end
