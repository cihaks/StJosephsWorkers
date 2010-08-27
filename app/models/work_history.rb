class WorkHistory < ActiveRecord::Base
    has_many :clients

    def self.search(search, page, page_limit)
      paginate :per_page=>page_limit, :page=>page,
               :conditions => ["name LIKE ? ", "%#{search}%"],
               :order => 'name'
    end
end

