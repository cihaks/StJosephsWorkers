# == Schema Information
# Schema version: 20090924043100
#
# Table name: crime_types
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class CrimeType < ActiveRecord::Base
  has_many :crime_sentences
end
