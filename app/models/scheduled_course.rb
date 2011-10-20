# == Schema Information
# Schema version: 20110331225232
#
# Table name: scheduled_courses
#
#  id          :integer(4)      not null, primary key
#  course_id   :integer(4)
#  capacity    :integer(4)
#  course_date :date
#  teacher     :string(255)
#  location    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class ScheduledCourse < ActiveRecord::Base
	belongs_to :course
	has_many :registered_classes
	
	def full_name
		course.name + "\t" + course_date_str + "\t(" + registered_classes.size.to_s + "/" + (capacity ? capacity.to_s : "-") + ")" if course
	end
	
	def course_name
		course.name if course
	end
	
	def course_date_str
		course_date.strftime("%a %m/%d/%Y %I:%M %p") if course_date
	end
	
	def self.search(search, page, page_limit)
		begin
			conditions = ["course_date >= ? ", DateTime.strptime("#{search}", "%m/%d/%Y")]
		rescue
			conditions = ["courses.name like ? ", "%#{search}%"]
		end
    paginate :per_page=>page_limit, :page=>page,
						 :include=>:course,
             :conditions => conditions,
             :order => 'course_date desc'
  end
  
end
