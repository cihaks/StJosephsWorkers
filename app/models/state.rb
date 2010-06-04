# == Schema Information
# Schema version: 20090924043100
#
# Table name: states
#
#  id          :integer(4)      not null, primary key
#  code        :string(2)
#  description :string(255)
#  country     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

# == Schema Information
# Schema version: 20090716055901
#
# Table name: states
#
#  id          :integer(4)      not null, primary key
#  code        :string(2)
#  description :string(255)
#  country     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class State < ActiveRecord::Base
  has_many :addresses
  has_many :clients, :through => :addresses, :uniq => true
end
