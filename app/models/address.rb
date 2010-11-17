# == Schema Information
# Schema version: 20100912050644
#
# Table name: addresses
#
#  id              :integer(4)      not null, primary key
#  client_id       :integer(4)
#  state_id        :integer(4)
#  address_type_id :integer(4)
#  address1        :string(255)
#  address2        :string(255)
#  city            :string(255)
#  address_type    :string(255)
#  zip_code        :integer(8)
#  primary_ind     :boolean(1)
#  current_ind     :boolean(1)
#  created_at      :datetime
#  updated_at      :datetime
#  creator_id      :integer(4)
#  updater_id      :integer(4)
#  shelter_id      :integer(4)
#


class Address < ActiveRecord::Base
  
  belongs_to :state
  belongs_to :client
  belongs_to :address_type
  belongs_to :shelter
  
  def full_address
    address = ""
    address = address+address1 unless address1.nil?
    address = address+", "+address2 unless (address2.nil? or address2.empty?)
    address = address+", "+city unless (city.nil? or city.empty?)
    address = address+", "+state.code unless state.nil?
    address = address+", "+zip_code.to_s unless zip_code.nil?
    address
  end
end
