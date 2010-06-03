class CreateResourceTypes < ActiveRecord::Migration
  def self.up
    create_table :resource_types do |t|
      t.string :name, :description, :type_name
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :resource_types
  end
end
