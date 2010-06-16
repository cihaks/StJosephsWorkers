class CreateDailyPasses < ActiveRecord::Migration
  def self.up
    create_table :daily_passes do |t|
      t.integer :assigned_resource_id
      t.string :company
      t.string :note, :limit=>2048

      t.timestamps
			t.userstamps
    end

    create_table :companies_daily_passes, :id=>false do |t|
      t.references :company
      t.references :daily_pass
    end
    

  end

  def self.down
		drop_table :companies_daily_passes
    drop_table :daily_passes
  end
end
