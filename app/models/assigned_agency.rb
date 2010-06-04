# == Schema Information
# Schema version: 20090924043100
#
# Table name: assigned_agencies
#
#  id         :integer(4)      not null, primary key
#  client_id  :integer(4)
#  agency_id  :integer(4)
#  start_date :date
#  end_date   :date
#  created_at :datetime
#  updated_at :datetime
#

# == Schema Information
# Schema version: 20090716055901
#
# Table name: assigned_agencies
#
#  id         :integer(4)      not null, primary key
#  client_id  :integer(4)
#  agency_id  :integer(4)
#  start_date :date
#  end_date   :date
#  created_at :datetime
#  updated_at :datetime
#

class AssignedAgency < ActiveRecord::Base
  belongs_to :client
  belongs_to :agency
end
