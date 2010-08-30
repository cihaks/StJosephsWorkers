# == Schema Information
# Schema version: 20100604003228
#
# Table name: prisons
#
#  id           :integer(4)      not null, primary key
#  name         :string(255)
#  county       :string(255)
#  out_of_state :boolean(1)
#  created_at   :datetime
#  updated_at   :datetime
#  creator_id   :integer(4)
#  updater_id   :integer(4)
#

class Prison < ActiveRecord::Base
  has_many :crime_sentences

  def self.search(search, page, page_limit)
    paginate :per_page=>page_limit, :page=>page,
             :conditions => ["name LIKE ? ", "%#{search}%"],
             :order => 'name'
  end
end
