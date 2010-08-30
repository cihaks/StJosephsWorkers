class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.integer :race_id, :education_id, :work_history_id
      t.string :first_name, :middle_name, :last_name, :gender, :education_subjects
      t.boolean :deleted
      t.date :birth_date
      t.string :work_note, :limit=>2048
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :clients
  end
end
