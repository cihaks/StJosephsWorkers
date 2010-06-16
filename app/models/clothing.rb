# == Schema Information
# Schema version: 20100604003228
#
# Table name: clothings
#
#  id                   :integer(4)      not null, primary key
#  assigned_resource_id :integer(4)
#  note                 :string(2048)
#  created_at           :datetime
#  updated_at           :datetime
#  creator_id           :integer(4)
#  updater_id           :integer(4)
#

class Clothing < ActiveRecord::Base
	belongs_to :assigned_resource
end
