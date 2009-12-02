class CreateJobApplications < ActiveRecord::Migration
  def self.up
    create_table :job_applications do |t|
      t.integer :client_id, :company_id, :industry_id
      t.date :application_date
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :job_applications
  end
end
