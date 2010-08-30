# == Schema Information
# Schema version: 20100604003228
#
# Table name: voice_mails
#
#  id                   :integer(4)      not null, primary key
#  assigned_resource_id :integer(4)
#  cvm_number           :string(255)
#  cvm_password         :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#

class VoiceMail < ActiveRecord::Base
  belongs_to :assigned_resource
end
