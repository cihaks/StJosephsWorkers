class CreateJobLeads < ActiveRecord::Migration
  def self.up
    create_table :job_leads do |t|
      t.integer :client_id
      t.string :client_name
      t.date :activity_date
      t.integer :job_developer_id
      t.string :job_developer_name
      t.string :company
      t.boolean :bus_pass
      t.boolean :verified
      t.boolean :application
      t.boolean :interview
      t.string :note

      t.timestamps
    end
  end

  def self.down
    drop_table :job_leads
  end
end
