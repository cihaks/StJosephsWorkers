class IncarcerationLength < ActiveRecord::Base
  has_many :crime_sentences
  
  def self.search(search, page, page_limit)
    paginate :per_page=>page_limit, :page=>page,
             :conditions => ["name LIKE ? ", "%#{search}%"],
             :order => 'list_order'
  end

	def self.find(*args)
	  options = args.last.is_a?(Hash) ? args.pop : {}
	  if not options.include? :order
	    options[:order] = 'list_order asc'
	  end
	  args.push(options)
	  super
	end

end
