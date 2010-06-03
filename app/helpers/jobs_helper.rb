module JobsHelper
  
	def link_to_remove_fields(name, f)
	  f.hidden_field(:_destroy) + link_to_function(name, "this.previous('input[type=hidden]').value = '1';this.up('.job_rate').hide()")
	end

	def link_to_add_fields(name, f)
	  fields = f.fields_for(:job_rates, JobRate.new, :child_index => "new_job_rate") do |builder|
      render("jobs/job_rate_fields", :f => builder)
    end
		# link_to_function(name, h("add_fields(this, \"job_rate\", \"#{escape_javascript(fields)}\")"))

		link_to_function name do |page|
		 	page.insert_html :bottom, :job_rates, "#{fields}"
		end
  end
	
end


