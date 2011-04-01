# == Schema Information
# Schema version: 20110331225232
#
# Table name: used_substances
#
#  id                    :integer(4)      not null, primary key
#  client_id             :integer(4)
#  substance_id          :integer(4)
#  sober_date            :date
#  treatment_program_ind :boolean(1)
#  created_at            :datetime
#  updated_at            :datetime
#  creator_id            :integer(4)
#  updater_id            :integer(4)
#

class UsedSubstance < ActiveRecord::Base
  belongs_to :substance
  belongs_to :client

	validates_date :sober_date, :allow_blank=>true
	validates_presence_of :substance_id
end
