class CreateRegisteredClasses < ActiveRecord::Migration
  def self.up
    create_table :registered_classes do |t|
      t.date :class_date, :waive_date
      t.integer :client_id
      t.integer :course_id
      t.boolean :completed
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :registered_classes
  end
end
