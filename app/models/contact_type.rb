# == Schema Information
# Schema version: 20090924043100
#
# Table name: contact_types
#
#  id          :integer(4)      not null, primary key
#  name        :string(25)
#  description :string(500)
#  created_at  :datetime
#  updated_at  :datetime
#

class ContactType < ActiveRecord::Base
  has_many :contacts
end
