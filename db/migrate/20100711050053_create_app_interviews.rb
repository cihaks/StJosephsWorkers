class CreateAppInterviews < ActiveRecord::Migration
  def self.up
    create_table :app_interviews do |t|
      t.integer :client_id, :company_id, :industry_id
      t.date :meeting_date
      t.boolean :application, :interview
      t.timestamps
			t.userstamps
    end
  end

  def self.down
    drop_table :app_interviews
  end
end
