# == Schema Information
# Schema version: 20090924043100
#
# Table name: assigned_resources
#
#  id               :integer(4)      not null, primary key
#  client_id        :integer(4)
#  resource_type_id :integer(4)
#  amount           :integer(4)
#  number           :integer(4)
#  verified         :boolean(1)
#  resource_date    :date
#  created_at       :datetime
#  updated_at       :datetime
#

class AssignedResource < ActiveRecord::Base
  belongs_to :resource_type
  belongs_to :client
  has_and_belongs_to_many :companies
  has_and_belongs_to_many :industries
  
  def after_save
    # if verified is false, set client.resource_eligible to false
  end
  
end
