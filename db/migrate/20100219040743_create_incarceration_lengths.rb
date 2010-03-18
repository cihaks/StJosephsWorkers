class CreateIncarcerationLengths < ActiveRecord::Migration
  def self.up
    create_table :incarceration_lengths do |t|
      t.string :name

      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :incarceration_lengths
  end
end
