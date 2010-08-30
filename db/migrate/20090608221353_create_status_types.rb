class CreateStatusTypes < ActiveRecord::Migration
  def self.up
    create_table :status_types do |t|
      t.string :name, :description, :category
      t.timestamps
      t.userstamps
    end
    
    create_table :clients_status_types, :id=>false do |t|
      t.references :client
      t.references :status_type
      t.date :start_date, :end_date
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :clients_status_types
    drop_table :status_types
  end
end
