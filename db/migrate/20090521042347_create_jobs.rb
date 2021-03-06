class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.integer :client_id, :job_type_id, :industry_id, :benefits_type_id
      t.boolean :current
			t.integer :company_id
      t.date :start_date, :end_date, :last_verified_date
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
