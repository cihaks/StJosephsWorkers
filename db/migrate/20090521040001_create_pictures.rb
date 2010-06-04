class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.integer :client_id
      t.column :picture, :blob, :limit => 1.megabyte
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :pictures
  end
end
