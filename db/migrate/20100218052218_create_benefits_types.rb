class CreateBenefitsTypes < ActiveRecord::Migration
  def self.up
    create_table :benefits_types do |t|
      t.string :name

      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :benefits_types
  end
end
