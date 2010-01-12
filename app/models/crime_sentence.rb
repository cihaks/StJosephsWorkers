# == Schema Information
# Schema version: 20090924043100
#
# Table name: crime_sentences
#
#  id            :integer(4)      not null, primary key
#  client_id     :integer(4)
#  prison_id     :integer(4)
#  crime_type_id :integer(4)
#  start_date    :date
#  end_date      :date
#  felony        :boolean(1)
#  violent       :boolean(1)
#  sex_offender  :boolean(1)
#  created_at    :datetime
#  updated_at    :datetime
#

class CrimeSentence < ActiveRecord::Base
  belongs_to :crime_type
  belongs_to :client
  belongs_to :prison
end
