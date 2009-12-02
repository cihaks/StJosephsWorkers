class CreateUsedSubstances < ActiveRecord::Migration
  def self.up
    create_table :used_substances do |t|
      t.integer :client_id, :substance_id
      t.date :entry_date, :sober_date
      t.boolean :treatment_program_ind
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :used_substances
  end
end


