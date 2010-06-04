class CreatePrisons < ActiveRecord::Migration
  def self.up
    create_table :prisons do |t|
      t.string :name, :county
      t.boolean :out_of_state
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :prisons
  end
end
