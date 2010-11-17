# == Schema Information
# Schema version: 20100912050644
#
# Table name: voice_mails
#
#  id                   :integer(4)      not null, primary key
#  assigned_resource_id :integer(4)
#  cvm_number           :string(255)
#  cvm_password         :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  creator_id           :integer(4)
#  updater_id           :integer(4)
#

class VoiceMail < ActiveRecord::Base
  belongs_to :assigned_resource

	after_create :set_phone 
	after_update :set_phone

	def set_phone
		if !cvm_number.blank?
			old_phone = cvm_number_changed? ? cvm_number_was : cvm_number
			new_phone = cvm_number
		  p = Phone.find_by_phone_number( old_phone )
		  if p
			  p.client_id = assigned_resource.client_id
			  p.primary_ind = true
			  p.phone_number = new_phone
			  p.save
			else
				Phone.create :phone_number => new_phone, :client_id => assigned_resource.client_id, :primary_ind => true
			end
	  end
	end

end
