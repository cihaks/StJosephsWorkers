class CreateAssignedStatusTypes < ActiveRecord::Migration
  def self.up
    create_table :assigned_status_types do |t|
      t.integer :status_type_id
      t.integer :client_id
      t.date :start_date
      t.date :end_date

      t.timestamps
			t.userstamps
    end
  end

  def self.down
    drop_table :assigned_status_types
  end
end
