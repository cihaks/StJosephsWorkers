class CreateIndustries < ActiveRecord::Migration
  def self.up
    create_table :industries do |t|
      t.string :name, :description
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :industries
  end
end
