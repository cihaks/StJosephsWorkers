class CreateAssignedResources < ActiveRecord::Migration
  def self.up
    create_table :assigned_resources do |t|
      t.integer :client_id, :resource_type_id, :amount, :number
      t.boolean :verified, :required_verification
      t.date :resource_date
      t.timestamps
      t.userstamps
    end
    
    create_table :assigned_resources_companies, :id=>false do |t|
      t.references :assigned_resource
      t.references :company
    end
    
    create_table :assigned_resources_industries, :id=>false do |t|
      t.references :assigned_resource
      t.references :industry
    end
  end

  def self.down
    drop_table :assigned_resources_industries
    drop_table :assigned_resources_companies
    drop_table :assigned_resources
  end
end
