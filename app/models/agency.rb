# == Schema Information
# Schema version: 20090924043100
#
# Table name: agencies
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Agency < ActiveRecord::Base
  belongs_to :agency_type
  has_many :assigned_agencies
  has_many :clients, :through => :assigned_agencies, :uniq => true
end
