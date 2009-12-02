# == Schema Information
# Schema version: 20090924043100
#
# Table name: prisons
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Prison < ActiveRecord::Base
  has_many :crime_sentences
end
