# == Schema Information
# Schema version: 20090924043100
#
# Table name: resource_types
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class ResourceType < ActiveRecord::Base
  has_many :assigned_resources
end
