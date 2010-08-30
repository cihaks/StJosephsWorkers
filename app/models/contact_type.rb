# == Schema Information
# Schema version: 20100604003228
#
# Table name: contact_types
#
#  id          :integer(4)      not null, primary key
#  name        :string(25)
#  description :string(500)
#  created_at  :datetime
#  updated_at  :datetime
#  creator_id  :integer(4)
#  updater_id  :integer(4)
#

class ContactType < ActiveRecord::Base
  has_many :contacts

  def self.search(search, page, page_limit)
    paginate :per_page=>page_limit, :page=>page,
             :conditions => ["name LIKE ? ", "%#{search}%"],
             :order => 'name'
  end
end
