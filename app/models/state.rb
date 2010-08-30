# == Schema Information
# Schema version: 20100604003228
#
# Table name: states
#
#  id          :integer(4)      not null, primary key
#  code        :string(2)
#  description :string(255)
#  country     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  creator_id  :integer(4)
#  updater_id  :integer(4)
#

class State < ActiveRecord::Base
  has_many :addresses
  has_many :clients, :through => :addresses, :uniq => true
end
