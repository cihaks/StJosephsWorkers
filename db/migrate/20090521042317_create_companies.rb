class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name, :description
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :companies
  end
end
