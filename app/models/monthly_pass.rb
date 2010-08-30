# == Schema Information
# Schema version: 20100604003228
#
# Table name: monthly_passes
#
#  id                   :integer(4)      not null, primary key
#  assigned_resource_id :integer(4)
#  amount_paid          :decimal(10, 2)
#  amount_due           :decimal(10, 2)
#  created_at           :datetime
#  updated_at           :datetime
#  note                 :string(2048)
#

class MonthlyPass < ActiveRecord::Base
  belongs_to :assigned_resource
end
