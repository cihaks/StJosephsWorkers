class CreateJobRates < ActiveRecord::Migration
  def self.up
    create_table :job_rates do |t|
      t.integer :job_id
      t.decimal :hourly_rate, :precision=>6, :scale=>2
      t.date :hourly_rate_date
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :job_rates
  end
end
