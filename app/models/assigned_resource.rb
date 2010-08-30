# == Schema Information
# Schema version: 20100604003228
#
# Table name: assigned_resources
#
#  id                    :integer(4)      not null, primary key
#  client_id             :integer(4)
#  resource_type_id      :integer(4)
#  amount                :integer(4)
#  number                :integer(4)
#  verified              :boolean(1)
#  required_verification :boolean(1)
#  resource_date         :date
#  created_at            :datetime
#  updated_at            :datetime
#  creator_id            :integer(4)
#  updater_id            :integer(4)
#

class AssignedResource < ActiveRecord::Base
  
  belongs_to :client
  belongs_to :resource_type
  has_one :daily_pass, :dependent=>:destroy
  has_one :monthly_pass, :dependent=>:destroy
  has_one :voice_mail, :dependent=>:destroy
  has_one :clothing, :dependent=>:destroy
  has_one :hygiene, :dependent=>:destroy

	accepts_nested_attributes_for :daily_pass, :allow_destroy=>true, :reject_if=>lambda { |attrs| attrs[:note].blank? && attrs[:company].blank? && attrs[:interview]=='0' && attrs[:application]=='0' }
	accepts_nested_attributes_for :monthly_pass, :allow_destroy=>true, :reject_if=>lambda { |attrs| attrs[:note].blank? && attrs[:amount_paid].blank? && attrs[:amount_due].blank? }
	accepts_nested_attributes_for :voice_mail, :allow_destroy=>true, :reject_if=>lambda { |attrs| attrs[:cvm_number].blank? && attrs[:cvm_password].blank? }
	accepts_nested_attributes_for :clothing, :allow_destroy=>true, :reject_if=>lambda { |attrs| attrs[:note].blank? }
	accepts_nested_attributes_for :hygiene, :allow_destroy=>true, :reject_if=>lambda { |attrs| attrs[:note].blank? }

	validates_date :resource_date

#	acts_as_domain_based_association do |config|
#		config.domain_type :resource_type #defines the type of the domain
		# maybe should loop through ResourceType objects and use ones with values in type_name
#		config.associations :daily_pass, :monthly_pass, :voice_mail, :clothing, :hygiene #defines associations with custom fields
#	end
  
end
