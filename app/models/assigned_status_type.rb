class AssignedStatusType < ActiveRecord::Base
	belongs_to :client
	belongs_to :status_type
	
	#create method to unassign, setting the end date
	
	def deassign
		puts "updating assigned status type"
		update_attributes({:end_date => Date.today})
	end
end
