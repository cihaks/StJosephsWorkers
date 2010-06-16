# == Schema Information
# Schema version: 20100604003228
#
# Table name: crime_sentences
#
#  id                      :integer(4)      not null, primary key
#  client_id               :integer(4)
#  prison_id               :integer(4)
#  start_date              :date
#  end_date                :date
#  release_date            :date
#  felony                  :boolean(1)
#  violent                 :boolean(1)
#  sex_offender            :boolean(1)
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
end
