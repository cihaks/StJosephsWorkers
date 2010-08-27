class CreateWorkHistories < ActiveRecord::Migration
  def self.up
    create_table :work_histories do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :work_histories
  end
end
