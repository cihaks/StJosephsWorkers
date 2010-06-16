# == Schema Information
# Schema version: 20100604003228
#
# Table name: daily_passes
#
#  id                   :integer(4)      not null, primary key
#  assigned_resource_id :integer(4)
#  company              :string(255)
#  note                 :string(2048)
#  created_at           :datetime
#  updated_at           :datetime
#

class DailyPass < ActiveRecord::Base
end
