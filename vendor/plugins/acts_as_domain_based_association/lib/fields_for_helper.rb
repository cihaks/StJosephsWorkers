module FieldsForHelper
	
	# def type_select(form, method, collection, value_method, text_method, options = {}, html_options = {} )
	# 	change_options = html_options[:onchange]
	# 	change_options = "" if change_options.nil?
	# 	collection.each do |obj|
	# 		change_options << "Element.hide('has_#{obj.id}'); " unless obj.type_name.nil? or obj.type_name.length==0
	# 	end
	# 	change_options << "Element.show('has_'+value);"
	# 	
	# 	html_options[:onchange] = change_options
	# 	form.collection_select(method, collection, value_method, text_method, options, html_options)
	# end
	
# 	def fields_for_association(domain, association_name, type, &block)
# 	  prefix = "my" 
# 	  object = eval("domain.new_record? ? domain.build_#{association_name} : domain.#{association_name}.nil? ? domain.build_#{association_name} : domain.#{association_name}")
# 		type = eval("#{domain.domain_type.camelize}.find(:first)") if type.nil?
# 	  concat div_for_association(association_name, type)
# #		fields_for("#{domain.class.name.underscore}[#{prefix}_#{association_name}][]", object, &block)
# 		fields_for("#{domain.class.name.underscore}[#{association_name}][]", object, &block)
# 		concat "</div>"
# 	  
# 	end
# 	
# 	private
# 	
# 	def div_for_association(association_name, type)
# 	  assoc_type = eval("#{type.class.name.to_s.camelize}.find_by_type_name(association_name.to_s)")
# 	  assoc_id = assoc_type.nil? ? association_name.to_s : assoc_type.id.to_s
# 		html=""
# 	  html << "<div id=\"has_#{assoc_id}\" " 
# 	  html << "style=\"display:none\"" unless !assoc_type.nil? and type.id == assoc_type.id
# 	  html << ">"
# 	  html
# 	end
end