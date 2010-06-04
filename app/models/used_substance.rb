# == Schema Information
# Schema version: 20090924043100
#
# Table name: used_substances
#
#  id           :integer(4)      not null, primary key
#  client_id    :integer(4)
#  substance_id :integer(4)
#  entry_date   :date
#  sober_date   :date
#  created_at   :datetime
#  updated_at   :datetime
#

# == Schema Information
# Schema version: 20090716055901
#
# Table name: used_substances
#
#  id           :integer(4)      not null, primary key
#  client_id    :integer(4)
#  substance_id :integer(4)
#  entry_date   :date
#  sober_date   :date
#  created_at   :datetime
#  updated_at   :datetime
#

class UsedSubstance < ActiveRecord::Base
  belongs_to :substance
  belongs_to :client
end
