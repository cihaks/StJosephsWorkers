# == Schema Information
# Schema version: 20100912050644
#
# Table name: monthly_passes
#
#  id                   :integer(4)      not null, primary key
#  assigned_resource_id :integer(4)
#  amount_paid          :decimal(10, 2)
#  amount_due           :decimal(10, 2)
#  note                 :string(2048)
#  created_at           :datetime
#  updated_at           :datetime
#  creator_id           :integer(4)
#  updater_id           :integer(4)
#

class MonthlyPass < ActiveRecord::Base
  belongs_to :assigned_resource
end
