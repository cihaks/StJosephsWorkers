# == Schema Information
# Schema version: 20090924043100
#
# Table name: addresses
#
#  id         :integer(4)      not null, primary key
#  client_id  :integer(4)
#  state_id   :integer(4)
#  address1   :string(255)
#  address2   :string(255)
#  city       :string(255)
#  zip_code   :integer(8)
#  start_date :date
#  end_date   :date
#  created_at :datetime
#  updated_at :datetime
#

class Address < ActiveRecord::Base
  belongs_to :state
  belongs_to :client
  belongs_to :address_type
  
  def full_address
    address = ""
    address+address1 unless address1.nil?
    address+", "+address2 unless address2.nil? or address2.empty?
    address+", "+city unless city.nil?
    address+", "+state.code unless state.nil?
    address+", "+zip_code.to_s unless zip_code.nil?
  end
end
