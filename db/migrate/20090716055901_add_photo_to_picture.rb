class AddPhotoToPicture < ActiveRecord::Migration
  def self.up
    add_column :pictures, :photo_file_name, :string
    add_column :pictures, :photo_content_type, :string
    add_column :pictures, :photo_file_size, :integer
  end
 
  def self.down
    remove_column :pictures, :photo_file_name
    remove_column :pictures, :photo_content_type
    remove_column :pictures, :photo_file_size
  end
end
