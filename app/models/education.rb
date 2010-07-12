# == Schema Information
# Schema version: 20100604003228
#
# Table name: educations
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Education < ActiveRecord::Base
  has_many :clients
  
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

