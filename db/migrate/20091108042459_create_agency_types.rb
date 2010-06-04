class CreateAgencyTypes < ActiveRecord::Migration
  def self.up
    create_table :agency_types do |t|
      t.string :name
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :agency_types
  end
end
