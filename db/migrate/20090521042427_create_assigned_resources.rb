class CreateAssignedResources < ActiveRecord::Migration
  def self.up
    create_table :assigned_resources do |t|
      t.integer :client_id, :resource_type_id, :amount, :number
      t.boolean :verified, :required_verification
      t.date :resource_date
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :assigned_resources
  end
end
