# == Schema Information
# Schema version: 20090924043100
#
# Table name: contacts
#
#  id               :integer(4)      not null, primary key
#  contact_type_id  :integer(4)
#  client_id        :integer(4)
#  contact_date     :date
#  contact_negative :boolean(1)
#  note             :string(2048)
#  alert            :boolean(1)
#  created_at       :datetime
#  updated_at       :datetime
#

class Contact < ActiveRecord::Base
  belongs_to :client
  belongs_to :contact_type
  
  def self.search(search, page, page_limit)
    paginate :per_page=>page_limit, :page=>page,
             :conditions => ["client_id = ?", "%#{search}%"],
             :order => 'contact_date desc'
  end
  
end
