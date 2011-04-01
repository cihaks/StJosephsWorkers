class RegisteredClassesDropColumns < ActiveRecord::Migration
  def self.up
		remove_column :registered_classes, :class_date
		remove_column :registered_classes, :course_id
  end

  def self.down
		add_column :registered_classes, :class_date, :date
		add_column :registered_classes, :course_id, :integer
  end
end
