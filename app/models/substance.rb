# == Schema Information
# Schema version: 20100912050644
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

	validates_uniqueness_of :name, :case_sensitive=>true, :allow_blank=>false
	
  def self.search(search, page, page_limit)
    paginate :per_page=>page_limit, :page=>page,
             :conditions => ["name LIKE ? ", "%#{search}%"],
             :order => 'name'
  end
end
