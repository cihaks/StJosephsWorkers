# == Schema Information
# Schema version: 20110331225232
#
# Table name: states
#
#  id          :integer(4)      not null, primary key
#  code        :string(2)
#  description :string(255)
#  country     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  creator_id  :integer(4)
#  updater_id  :integer(4)
#

class State < ActiveRecord::Base
  has_many :addresses
  has_many :clients, :through => :addresses, :uniq => true

	validates_uniqueness_of :code, :case_sensitive=>false, :allow_blank=>false, :scope=>:country
	validates_presence_of :name
	
	
end
