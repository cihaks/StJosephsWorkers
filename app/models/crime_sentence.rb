# == Schema Information
# Schema version: 20110331225232
#
# Table name: crime_sentences
#
#  id                      :integer(4)      not null, primary key
#  client_id               :integer(4)
#  prison_id               :integer(4)
#  created_at              :datetime
#  updated_at              :datetime
#  creator_id              :integer(4)
#  updater_id              :integer(4)
#  incarceration_length_id :integer(4)
#  furlough                :boolean(1)
#

class CrimeSentence < ActiveRecord::Base
  belongs_to :client
  belongs_to :prison
  belongs_to :incarceration_length
  
  has_and_belongs_to_many :crime_types
  has_and_belongs_to_many :convictions
	
	accepts_nested_attributes_for :crime_types
	accepts_nested_attributes_for :convictions
end
