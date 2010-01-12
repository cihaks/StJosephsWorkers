  # == Schema Information
# Schema version: 20090924043100
#
# Table name: clients
#
#  id                :integer(4)      not null, primary key
#  race_id           :integer(4)
#  first_name        :string(255)
#  middle_name       :string(255)
#  last_name         :string(255)
#  gender            :string(255)
#  caution           :boolean(1)
#  resource_eligible :boolean(1)
#  veteran           :boolean(1)
#  success_story     :boolean(1)
#  birth_date        :date
#  created_at        :datetime
#  updated_at        :datetime
#

class Client < ActiveRecord::Base
  belongs_to :race
  has_many :pictures
  has_many :addresses, :order => "start_date DESC"
  has_many :phones
  has_many :contacts, :order => "contact_date desc"
  has_many :assigned_resources
  has_many :registered_classes, :order => "class_date DESC"
  has_many :used_substances, :order => "sober_date DESC"
  has_many :crime_sentences, :order => "start_date DESC"
  has_many :assigned_agencies, :order => "start_date DESC"
  has_many :jobs, :order => "start_date DESC"
  has_many :job_interviews, :order => "interview_date DESC"
  has_many :job_applications, :order => "application_date DESC"

  has_and_belongs_to_many :status_types

  has_many :resource_types, :through => :assigned_resources, :uniq => true
  has_many :substances, :through => :used_substances, :uniq => true
  has_many :agencies, :through => :assigned_agencies, :uniq => true
  has_many :courses, :through => :registered_classes, :source => :course, :uniq => true
  
  def name
    if first_name.nil?
      if middle_name.nil?
        if last_name.nil?
          "<no name for client>"
        else
          last_name
        end
      else
        if last_name.nil?
          middle_name
        else
          middle_name + last_name
        end
      end
    else
      if middle_name.nil?
        if last_name.nil?
          first_name
        else
          first_name + " " + last_name
        end
      else
        if last_name.nil?
          first_name + " " + middle_name
        else
          first_name + " " + middle_name + " " + last_name
        end
      end
    end
  end
  
  def self.search(search, page, page_limit)
    paginate :per_page=>page_limit, :page=>page,
             :conditions => ["first_name LIKE ? or middle_name LIKE ? or last_name LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%"],
             :order => 'last_name, first_name, middle_name'
  end
end
