# == Schema Information
# Schema version: 20100912050644
#
# Table name: work_histories
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class WorkHistory < ActiveRecord::Base
    has_many :clients

		validates_uniqueness_of :name, :case_sensitive=>false, :allow_blank=>false
		validates_presence_of :name

    def self.search(search, page, page_limit)
      paginate :per_page=>page_limit, :page=>page,
               :conditions => ["name LIKE ? ", "%#{search}%"],
               :order => 'name'
    end
end

