class CreateCrimeSentences < ActiveRecord::Migration
  def self.up
    create_table :crime_sentences do |t|
      t.integer :client_id, :prison_id, :crime_type_id
      t.date :start_date, :end_date, :release_date
      t.boolean :felony, :violent, :sex_offender
      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :crime_sentences
  end
end
