# == Schema Information
# Schema version: 20090924043100
#
# Table name: industries
#
#  id            :integer(4)      not null, primary key
#  name          :string(255)
#  description   :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Industry < ActiveRecord::Base
  has_many :jobs
  has_many :job_applications
  has_many :job_interviews

  def self.search(search, page, page_limit)
    paginate :per_page=>page_limit, :page=>page,
             :conditions => ["name LIKE ? ", "%#{search}%"],
             :order => 'name'
  end
end
