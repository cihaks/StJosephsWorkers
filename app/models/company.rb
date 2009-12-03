# == Schema Information
# Schema version: 20090924043100
#
# Table name: companies
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)
#  description        :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#


class Company < ActiveRecord::Base
  has_many :job_interviews
  has_many :job_applications
  has_many :jobs
  has_and_belongs_to_many :assigned_resources
  
  def to_label
    name
  end

  def self.search(search, page, page_limit)
    paginate :per_page=>page_limit, :page=>page,
             :conditions => ["name LIKE ? ", "%#{search}%"],
             :order => 'name'
  end
end
