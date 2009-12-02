# == Schema Information
# Schema version: 20090924043100
#
# Table name: status_types
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class StatusType < ActiveRecord::Base
  has_and_belongs_to_many :clients
end
