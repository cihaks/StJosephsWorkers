class CreateScheduledCourses < ActiveRecord::Migration
  def self.up
    create_table :scheduled_courses do |t|
      t.integer :course_id
      t.integer :capacity
      t.datetime :course_date
      t.string :teacher
      t.string :location

      t.timestamps
    end
  end

  def self.down
    drop_table :scheduled_courses
  end
end
