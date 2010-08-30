module AssignedResourcesHelper
	
	def type_select(form, method, collection, value_method, text_method, options = {}, html_options = {} )
		change_options = html_options[:onchange]
		change_options = "" if change_options.nil?
		collection.each do |obj|
			change_options << "Element.hide('has_#{obj.id}'); " unless obj.type_name.nil? or obj.type_name.length==0
		end
		change_options << "Element.show('has_'+value);"
		
		html_options[:onchange] = change_options
		form.collection_select(method, collection, value_method, text_method, options, html_options)
	end
	
end
