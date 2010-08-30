class AddIconToStatusType < ActiveRecord::Migration
  def self.up
    add_column :status_types, :icon_file_name, :string
    add_column :status_types, :icon_content_type, :string
    add_column :status_types, :icon_file_size, :integer
  end

  def self.down
    remove_column :status_types, :icon_file_name
    remove_column :status_types, :icon_content_type
    remove_column :status_types, :icon_file_size
  end
end
