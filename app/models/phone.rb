# == Schema Information
# Schema version: 20090924043100
#
# Table name: phones
#
#  id           :integer(4)      not null, primary key
#  client_id    :integer(4)
#  phone_number :string(255)
#  primary      :boolean(1)
#  created_at   :datetime
#  updated_at   :datetime
#

# == Schema Information
# Schema version: 20090716055901
#
# Table name: phones
#
#  id           :integer(4)      not null, primary key
#  client_id    :integer(4)
#  phone_number :string(255)
#  primary      :boolean(1)
#  created_at   :datetime
#  updated_at   :datetime
#

class Phone < ActiveRecord::Base
  belongs_to :client
  
  def is_primary?
    self.primary_ind
  end
  
end
