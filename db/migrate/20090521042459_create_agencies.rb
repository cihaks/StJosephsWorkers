class CreateAgencies < ActiveRecord::Migration
  def self.up
    create_table :agencies do |t|
      t.integer :agency_type_id
      t.string :name
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :agencies
  end
end
