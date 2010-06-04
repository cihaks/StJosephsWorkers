class CreateConvictions < ActiveRecord::Migration
  def self.up
    create_table :convictions do |t|
			t.string :name,:description

      t.timestamps
			t.userstamps
    end
		
		create_table :convictions_crime_sentences, :id=>false do |t|
			t.references :crime_sentence
			t.references :conviction
		end
  end

  def self.down
		drop_table :convictions_crime_sentences
    drop_table :convictions
  end
end
