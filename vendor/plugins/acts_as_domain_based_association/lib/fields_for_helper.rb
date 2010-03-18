module FieldsForHelper
	def fields_for_association(domain, association_name, &block)
	  prefix = "my" 
	  object = eval("domain.new_record? ? domain.build_#{association_name} : domain.#{association_name}.nil? ? domain.build_#{association_name} : domain.#{association_name}")
	  fields_for("#{domain.class.name.underscore}[#{prefix}_#{association_name}][]", object, &block)
	end
end