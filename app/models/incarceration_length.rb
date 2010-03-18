class IncarcerationLength < ActiveRecord::Base
  has_many :crime_sentences
  
  def self.search(search, page, page_limit)
    paginate :per_page=>page_limit, :page=>page,
             :conditions => ["name LIKE ? ", "%#{search}%"],
             :order => 'id'
  end
end
