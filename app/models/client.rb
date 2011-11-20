# == Schema Information
# Schema version: 20110331225232
#
# Table name: clients
#
#  id                 :integer(4)      not null, primary key
#  race_id            :integer(4)
#  first_name         :string(255)
#  middle_name        :string(255)
#  last_name          :string(255)
#  gender             :string(255)
#  birth_date         :date
#  created_at         :datetime
#  updated_at         :datetime
#  creator_id         :integer(4)
#  updater_id         :integer(4)
#  education_id       :integer(4)
#  education_subjects :string(255)
#  deleted            :boolean(1)
#  work_note          :string(2048)
#  work_history_id    :integer(4)
#


class Client < ActiveRecord::Base
  belongs_to :race
  belongs_to :education
  belongs_to :work_history

  has_many :pictures, :dependent=>:destroy
  has_many :addresses, :order => "address_type_id", :dependent=>:destroy
  has_many :phones, :order => "primary_ind DESC, updated_at DESC, id DESC", :dependent=>:destroy
  has_many :contacts, :order => "contact_date DESC, id DESC", :dependent=>:destroy

  has_many :assigned_resources, :order => "resource_date DESC, id DESC", :dependent=>:destroy
  has_many :registered_classes, :dependent=>:destroy #TODO: determine order
  has_many :used_substances, :order => "sober_date DESC", :dependent=>:destroy
  has_many :crime_sentences, :order => "created_at DESC", :dependent=>:destroy
  has_many :assigned_agencies, :order => "updated_at DESC, id DESC", :dependent=>:destroy
  has_many :jobs, :order => "start_date DESC", :dependent=>:destroy
	has_many :app_interviews, :order => "meeting_date DESC", :dependent=>:destroy

  #has_and_belongs_to_many :status_types
  has_many :assigned_status_types, :dependent=>:destroy
  has_many :status_types, :through => :assigned_status_types, :uniq => false
  has_many :active_status_types, :through => :assigned_status_types, 
							:source => :status_type, :conditions => ['end_date is null and start_date <= ?', Date.today], :uniq => true

	has_many :resource_types, :through => :assigned_resources, :uniq => true
  has_many :substances, :through => :used_substances, :uniq => true
  has_many :agencies, :through => :assigned_agencies, :uniq => true
  has_many :scheduled_courses, :through => :registered_classes, :source => :scheduled_course, :uniq => true

	accepts_nested_attributes_for :contacts, :allow_destroy=>true, :reject_if=>lambda { |a| a[:note].blank? }
	accepts_nested_attributes_for :registered_classes, :allow_destroy=>true, :reject_if=>lambda { |a| a[:class_date].blank? or a[:course_id].blank? }
	accepts_nested_attributes_for :used_substances, :allow_destroy=>true, :reject_if=>lambda { |a| a[:substance_id].blank? }
	accepts_nested_attributes_for :addresses, :allow_destroy=>true, :reject_if=>lambda { |a| a[:address1].blank? }
	accepts_nested_attributes_for :phones, :allow_destroy=>true, :reject_if=>lambda { |a| a[:phone_number].blank? }
	accepts_nested_attributes_for :assigned_resources, :allow_destroy=>true, :reject_if=>lambda { |a| a[:resource_type_id].blank? }
	accepts_nested_attributes_for :crime_sentences, :allow_destroy=>true, :reject_if=>lambda { |a| a[:prison_id].blank? }
	accepts_nested_attributes_for :assigned_agencies, :allow_destroy=>true, :reject_if=>lambda { |a| a[:agency_id].blank? }
	accepts_nested_attributes_for :jobs, :allow_destroy=>true, :reject_if=>lambda { |a| a[:job_type_id].blank? }
	accepts_nested_attributes_for :app_interviews, :allow_destroy=>true, :reject_if=>lambda { |a| a[:meeting_date].blank? }
  
  validates_uniqueness_of :birth_date, :scope=>[:first_name, :last_name]
	validates_date :birth_date
  	
  def name
    if first_name.nil?
      if middle_name.nil?
        if last_name.nil?
          display_name = "<no name for client>"
        else
          display_name = last_name
        end
      else
        if last_name.nil?
          display_name = middle_name
        else
          display_name = middle_name + last_name
        end
      end
    else
      if middle_name.nil?
        if last_name.nil?
          display_name = first_name
        else
          display_name = first_name + " " + last_name
        end
      else
        if last_name.nil?
          display_name = first_name + " " + middle_name
        else
          display_name = first_name + " " + middle_name + " " + last_name
        end
      end
    end
		display_name = display_name + " (deleted)" if deleted unless deleted.nil?
		display_name
  end
  
  def self.search(search, page, page_limit, admin = false)
    search_array = search.split unless search.nil?
    search_array ||= []
    
    if search_array[1].nil?
      search_condition = "(first_name LIKE :name1 or middle_name LIKE :name1 or last_name LIKE :name1 or id like :name1)"
      search_values = {:name1=>"%#{search_array[0]}%"}
    else
      search_condition = "(first_name LIKE :name1 or middle_name LIKE :name1 or last_name LIKE :name1 or id like :name1) and (first_name LIKE :name2 or middle_name LIKE :name2 or last_name LIKE :name2)"
      search_values = {:name1=>"%#{search_array[0]}%", :name2=>"%#{search_array[1]}%"}
    end
    
		unless admin
			search_condition = search_condition + " and (deleted = false or deleted is null)"
		else
			search_condition = search_condition + " and deleted = true"
		end
		
    paginate :per_page=>page_limit, :page=>page,
             :conditions => [search_condition, search_values],
             :order => 'last_name, first_name, middle_name'
  end
end
