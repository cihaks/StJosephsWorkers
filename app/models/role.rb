# == Schema Information
# Schema version: 20090924043100
#
# Table name: roles
#
#  id   :integer(4)      not null, primary key
#  name :string(255)
#

class Role < ActiveRecord::Base
  
  def self.search(search, page, page_limit)
    paginate :per_page=>page_limit, :page=>page,
             :conditions => ["name LIKE ? ", "%#{search}%"],
             :order => 'name'
  end

end
