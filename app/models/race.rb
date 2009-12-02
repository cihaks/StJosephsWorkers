# == Schema Information
# Schema version: 20090924043100
#
# Table name: races
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Race < ActiveRecord::Base
  has_many :clients
end
