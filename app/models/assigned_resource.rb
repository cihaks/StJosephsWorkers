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
#  has_and_belongs_to_many :companies
#  has_and_belongs_to_many :industries

	validates_date :resource_date

	acts_as_domain_based_association do |config|
		config.domain_type :resource_type #defines the type of the domain
		# maybe should loop through ResourceType objects and use ones with values in type_name
		config.associations :daily_pass, :monthly_pass, :voice_mail, :clothing, :hygiene #defines associations with custom fields
	end
  
	after_create :set_phone 
	after_update :set_phone
			
	def set_phone
		if voice_mail and !voice_mail.cvm_number.blank?
			old_phone = voice_mail.cvm_number_changed? ? voice_mail.cvm_number_was : voice_mail.cvm_number
			new_phone = voice_mail.cvm_number
		  p = Phone.find_by_phone_number( old_phone )
		  if p
			  p.client_id = client_id
			  p.primary_ind = true
			  p.phone_number = new_phone
			  p.save
			else
				Phone.create :phone_number => new_phone, :client_id => client_id, :primary_ind => true
			end
	  end
	end
end
