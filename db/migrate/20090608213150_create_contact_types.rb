class CreateContactTypes < ActiveRecord::Migration
  def self.up
    create_table :contact_types do |t|
      t.string :name, :limit =>25
      t.string :description, :limit=>500
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :contact_types
  end
end
