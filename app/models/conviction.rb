class Conviction < ActiveRecord::Base
  has_and_belongs_to_many :crime_sentences

  def self.search(search, page, page_limit)
    paginate :per_page=>page_limit, :page=>page,
             :conditions => ["name LIKE ? ", "%#{search}%"],
             :order => 'name'
  end

end
