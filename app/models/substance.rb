# == Schema Information
# Schema version: 20090924043100
#
# Table name: substances
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# == Schema Information
# Schema version: 20090716055901
#
# Table name: substances
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Substance < ActiveRecord::Base
  has_many :used_substances
  has_many :clients, :through => :used_substances, :uniq => true
end
