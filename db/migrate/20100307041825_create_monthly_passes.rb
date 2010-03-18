class CreateMonthlyPasses < ActiveRecord::Migration
  def self.up
    create_table :monthly_passes do |t|
      t.integer :assigned_resource_id
      t.decimal :amount_paid, :precision => 10, :scale => 2
      t.decimal :amount_due, :precision => 10, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :monthly_passes
  end
end
