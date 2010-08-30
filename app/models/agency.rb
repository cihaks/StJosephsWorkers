# == Schema Information
# Schema version: 20100604003228
#
# Table name: agencies
#
#  id             :integer(4)      not null, primary key
#  agency_type_id :integer(4)
#  name           :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  creator_id     :integer(4)
#  updater_id     :integer(4)
#


class Agency < ActiveRecord::Base
  belongs_to :agency_type
  has_many :assigned_agencies
  has_many :clients, :through => :assigned_agencies, :uniq => true
  
  def self.search(search, page, page_limit)
    paginate :per_page=>page_limit, :page=>page,
             :conditions => ["name LIKE ? ", "%#{search}%"],
             :order => 'name'
  end

end
