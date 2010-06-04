class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.integer :contact_type_id
      t.integer :client_id
      t.date :contact_date
      t.boolean :contact_negative
      t.boolean :alert
      t.string :note, :limit=>2048
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
