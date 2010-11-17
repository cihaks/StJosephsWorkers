# == Schema Information
# Schema version: 20100912050644
#
# Table name: assigned_agencies
#
#  id            :integer(4)      not null, primary key
#  client_id     :integer(4)
#  agency_id     :integer(4)
#  created_at    :datetime
#  updated_at    :datetime
#  creator_id    :integer(4)
#  updater_id    :integer(4)
#  staff_contact :string(255)
#

class AssignedAgency < ActiveRecord::Base
  belongs_to :client
  belongs_to :agency
end
