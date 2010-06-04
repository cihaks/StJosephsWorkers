class Job < ActiveRecord::Base
  belongs_to :client
  belongs_to :job_type
  belongs_to :company
  belongs_to :industry
  belongs_to :benefits_type
  has_many :job_rates, :order=>"hourly_rate_date DESC", :dependent => :destroy
  accepts_nested_attributes_for :job_rates, :reject_if => lambda { |a| a[:hourly_rate].blank? and !a[:_destroy].blank? }, :allow_destroy => true
  
  after_update :save_job_rates
  
  # def new_job_rate_attributes=(job_rate_attributes)
  #     job_rate_attributes.each do |attributes|
  #       job_rates.build(attributes)
  #     end
  #   end
  #   
  #   def existing_job_rate_attributes=(job_rate_attributes)
  #     job_rates.reject(&:new_record?).each do |job_rate|
  #       attributes = job_rate_attributes[job_rate.id.to_s]
  #       if attributes
  #         job_rate.attributes = attributes
  #       else
  #         job_rates.delete(job_rate)
  #       end
  #     end
  #   end

  def company_name
	  company.name if company
	end
	
	def company_name=(name)
		self.company = Company.find_or_create_by_name(name) unless name.blank?
	end

  def save_job_rates
    job_rates.each do |job_rate|
      job_rate.save(false)
    end
  end
  
end
