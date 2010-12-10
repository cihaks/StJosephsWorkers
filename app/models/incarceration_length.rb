# == Schema Information
# Schema version: 20100912050644
#
# Table name: incarceration_lengths
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  list_order :integer(4)
#  created_at :datetime
#  updated_at :datetime
#  creator_id :integer(4)
#  updater_id :integer(4)
#

class IncarcerationLength < ActiveRecord::Base
  has_many :crime_sentences
  
	validates_uniqueness_of :name, :case_sensitive=>false, :allow_blank=>false
	validates_presence_of :name
	
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
