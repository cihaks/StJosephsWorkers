class AddInactiveToStatusType < ActiveRecord::Migration
  def self.up
		add_column :status_types, :inactive, :boolean, :default=>false
  end

  def self.down
		remove_column :status_types, :inactive
  end
end
