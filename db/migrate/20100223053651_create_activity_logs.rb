class CreateActivityLogs < ActiveRecord::Migration
  def self.up
    create_table :activity_logs do |t|
      t.integer :client_id, :model_id
      t.string :action
      t.string :model_name

      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :activity_logs
  end
end
