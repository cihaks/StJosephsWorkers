class CreateEducations < ActiveRecord::Migration
  def self.up
    create_table :educations do |t|
      t.string :name
      t.string :description
			t.integer :list_order

      t.timestamps
    end
  end

  def self.down
    drop_table :educations
  end
end
