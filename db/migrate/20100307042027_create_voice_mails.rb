class CreateVoiceMails < ActiveRecord::Migration
  def self.up
    create_table :voice_mails do |t|
      t.integer :assigned_resource_id
      t.string :cvm_number
      t.string :cvm_password

      t.timestamps
    end
  end

  def self.down
    drop_table :voice_mails
  end
end
