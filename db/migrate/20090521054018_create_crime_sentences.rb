class CreateCrimeSentences < ActiveRecord::Migration
  def self.up
    create_table :crime_sentences do |t|
      t.integer :client_id, :prison_id, :incarceration_length_id
      t.boolean :furlough
      t.timestamps
      t.userstamps
    end
    
    create_table :crime_sentences_crime_types, :id=>false do |t|
      t.references :crime_sentence
      t.references :crime_type
    end
  end

  def self.down
    drop_table :crime_sentences_crime_types
    drop_table :crime_sentences
  end
end
