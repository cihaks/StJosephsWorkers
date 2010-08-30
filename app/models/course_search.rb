# == Schema Information
# Schema version: 20100604003228
#
# Table name: course_searches
#
#  course_id :integer
#  from_date :date
#  to_date   :date
#

# TODO: revamp with validates_date method?

class CourseSearch < ActiveRecord::Base
	def self.columns() @columns ||= []; end

	def self.column(name, sql_type = nil, default = nil, null = true)
	  columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
	end
	
	column :course_id, :integer
	column :from_date, :date
	column :to_date, :date
	
	# attr_accessor :course_id, :from_date, :to_date
	
	def from_date_string
	  from_date.strftime("%m/%d/%Y") unless from_date.nil?
	end

	def from_date_string=(dt_str)
		begin
	    self.from_date = Date.parse(dt_str) 
	  rescue 
		  @from_date_invalid = true
		end
	end

	def to_date_string
	  to_date.strftime("%m/%d/%Y") unless to_date.nil?
	end

	def to_date_string=(dt_str)
		begin
	    self.to_date = Date.parse(dt_str) 
	  rescue 
		  @to_date_invalid = true
		end
	end
	
	def validate
	  errors.add(:from_date, "From Date is invalid") if @from_date_invalid
		errors.add(:to_date, "To Date is invalid") if @to_date_invalid
		unless from_date.nil? or to_date.nil? or @from_date_invalid or @to_date_invalid
		  errors.add(:from_date, "is after To Date") if from_date > to_date
	  end
	end
	
	# def self.build(fields = {})
	# 	me = CourseSearch.new
	# 	# fields ||= {:course_id => Course.all.first.id, :from_date => 1.month.ago, :to_date => 1.month.from_now}
	# 	unless fields.nil?
	# 		me.course_id = fields[:course_id] unless fields[:course_id].nil?
	# 		me.from_date_string = fields[:from_date_string] unless fields[:from_date_string].nil?
	# 		me.to_date_string = fields[:to_date_string] unless fields[:to_date_string].nil?
	# 		me.from_date = fields[:from_date] unless fields[:from_date].nil?
	# 		me.to_date = fields[:to_date] unless fields[:to_date].nil?
	#   end 
	# 	me
	# end
	
	# def errors
	#   @errors ||= ActiveRecord::Errors.new(self)
	# end
	# 
	# 
end
