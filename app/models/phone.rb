# == Schema Information
# Schema version: 20110331225232
#
# Table name: phones
#
#  id           :integer(4)      not null, primary key
#  client_id    :integer(4)
#  phone_number :string(255)
#  primary_ind  :boolean(1)
#  created_at   :datetime
#  updated_at   :datetime
#  creator_id   :integer(4)
#  updater_id   :integer(4)
#  extension    :string(20)
#

class Phone < ActiveRecord::Base
  belongs_to :client

	validates_presence_of :phone_number
  
  def is_primary?
    self.primary_ind
  end
  
end
