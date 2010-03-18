class CreateDailyPasses < ActiveRecord::Migration
  def self.up
    create_table :daily_passes do |t|
      t.integer :assigned_resource_id
      t.string :company
      t.string :note, :limit=>2048

      t.timestamps
    end
  end

  def self.down
    drop_table :daily_passes
  end
end
