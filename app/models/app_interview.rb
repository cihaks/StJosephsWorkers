class AppInterview < ActiveRecord::Base
  belongs_to :client
  belongs_to :company
  belongs_to :industry

	validates_date :meeting_date

  def company_name
	  company.name if company
	end
	
	def company_name=(name)
		self.company = Company.find_or_create_by_name(name) unless name.blank?
	end

end
