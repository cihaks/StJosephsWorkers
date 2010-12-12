class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.integer :client_id, :state_id, :address_type_id, :shelter_id
      t.string :address1, :address2, :city
      t.column :zip_code, :integer, :limit => 5
      t.boolean :primary_ind, :current_ind
      t.timestamps
      t.userstamps
    end
  end

  def self.down
 drop_table :addresses
  end
end

