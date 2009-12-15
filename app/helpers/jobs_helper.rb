module JobsHelper
  def fields_for_job_rate(job_rate, &block)
    prefix = job_rate.new_record? ? 'new' : 'existing'
    fields_for("job[#{prefix}_job_rate_attributes][]", job_rate, &block)
  end
  
  def add_job_rate_link(name) 
    link_to_function name do |page| 
      page.insert_html :bottom, :job_rates, :partial => 'jobs/job_rate', :object => JobRate.new 
    end 
  end 
end
