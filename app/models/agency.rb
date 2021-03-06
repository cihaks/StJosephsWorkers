# == Schema Information
# Schema version: 20110331225232
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
  
	validates_uniqueness_of :name, :case_sensitive=>false, :allow_blank=>false
	validates_presence_of :name

  def self.search(search, page, page_limit)
    paginate :per_page=>page_limit, :page=>page,
             :conditions => ["name LIKE ? ", "%#{search}%"],
             :order => 'name'
  end
	
	before_create :fake_error
	
	def fake_error
		errors.add(:name)
		false
	end
end
