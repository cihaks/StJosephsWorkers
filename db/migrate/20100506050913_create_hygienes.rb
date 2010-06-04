class CreateHygienes < ActiveRecord::Migration
  def self.up
    create_table :hygienes do |t|
	    t.integer :assigned_resource_id
      t.string :note, :limit=>2048

      t.timestamps
			t.userstamps
    end
  end

  def self.down
    drop_table :hygienes
  end
end
