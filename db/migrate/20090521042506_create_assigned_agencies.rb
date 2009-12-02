class CreateAssignedAgencies < ActiveRecord::Migration
  def self.up
    create_table :assigned_agencies do |t|
      t.integer :client_id, :agency_id
      t.date :start_date, :end_date
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :assigned_agencies
  end
end
