class CreatePrograms < ActiveRecord::Migration
  def self.up
    create_table :programs do |t|
      t.string :name, :description
      t.timestamps
      t.userstamps
    end
    
    create_table :clients_programs, :id=>false do |t|
      t.references :client
      t.references :jobs
      t.references :programs
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :clients_programs
    drop_table :programs
  end
end
