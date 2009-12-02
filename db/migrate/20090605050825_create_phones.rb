class CreatePhones < ActiveRecord::Migration
  def self.up
    create_table :phones do |t|
      t.integer :client_id
      t.string :phone_number
      t.boolean :primary

      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :phones
  end
end
