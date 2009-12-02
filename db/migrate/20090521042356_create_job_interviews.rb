class CreateJobInterviews < ActiveRecord::Migration
  def self.up
    create_table :job_interviews do |t|
      t.integer :client_id, :company_id, :industry_id
      t.date :interview_date
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :job_interviews
  end
end
