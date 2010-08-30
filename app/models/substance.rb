# == Schema Information
# Schema version: 20100604003228
#
# Table name: substances
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  creator_id :integer(4)
#  updater_id :integer(4)
#

class Substance < ActiveRecord::Base
  has_many :used_substances
  has_many :clients, :through => :used_substances, :uniq => true

  def self.search(search, page, page_limit)
    paginate :per_page=>page_limit, :page=>page,
             :conditions => ["name LIKE ? ", "%#{search}%"],
             :order => 'name'
  end
end
