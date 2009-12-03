# == Schema Information
# Schema version: 20090924043100
#
# Table name: prisons
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Prison < ActiveRecord::Base
  has_many :crime_sentences

  def self.search(search, page, page_limit)
    paginate :per_page=>page_limit, :page=>page,
             :conditions => ["name LIKE ? ", "%#{search}%"],
             :order => 'name'
  end
end
