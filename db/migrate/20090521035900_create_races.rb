class CreateRaces < ActiveRecord::Migration
  def self.up
    create_table :races do |t|
      t.string :name, :description
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :races
  end
end
