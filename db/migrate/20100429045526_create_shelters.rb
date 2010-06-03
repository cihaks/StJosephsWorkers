class CreateShelters < ActiveRecord::Migration
  def self.up
    create_table :shelters do |t|
      t.string :name, :description
      t.timestamps
			t.userstamps
    end
  end

  def self.down
    drop_table :shelters
  end
end
