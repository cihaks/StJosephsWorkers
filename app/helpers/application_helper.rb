# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
	#  method to add a subelement form to an existing page.
	#  includes addition of 'remove' link
	def add_element_link(name, form_builder, association, partial_view=nil, element_name=nil)
		new_object = form_builder.object.class.reflect_on_association(association).klass.new
		partial_view = "#{association.to_s}/form" unless partial_view
		element_tag = "#{association.to_s}-element" unless element_name
    link_to_function name do |page|
      form_builder.fields_for association, new_object, :child_index => 'NEW_RECORD' do |subform|
				html = "<div class=\"#{association.to_s.singularize}\">"
        html = html + render(:partial => partial_view, :locals => { :f => subform })
				html = html + remove_element_link(subform, association.to_s.singularize)
				html = html + "</div>"
        page << "$('#{element_tag}').insert({ bottom: '#{escape_javascript(html)}'.replace(/NEW_RECORD/g, new Date().getTime()) });"
      end
    end
  end

  def remove_element_link(form_builder, klass)
    if form_builder.object.new_record?
      # If the object is a new record, we can just remove the div from the dom
      link_to_function("remove", "$(this).up('.#{klass}').remove();");
    else
      # However if it's a "real" record it has to be deleted from the database,
      # for this reason the new fields_for, accept_nested_attributes helpers give us _delete,
      # a virtual attribute that tells rails to delete the child record.
      form_builder.hidden_field(:_delete) +
      link_to_function("remove", "$(this).up('.#{klass}').hide(); $(this).previous().value = '1'")
    end
  end
	
	# fix for bug in number_to_currency
	# to change to percentage, use :format=>"%%%s"
	def formatted_number(n, options={})
	  options = {
	    :precision => 2,
	    :separator => '.',
	    :delimiter => ',',
	    :format => "$%s"
	  }.merge(options)
		
		a,b = sprintf("%0.#{options[:precision]}f", n.to_s.to_f).split('.')
	  a.gsub!(/(\d)(?=(\d{3})+(?!\d))/, "\\1#{options[:delimiter]}")
	  sprintf(options[:format], "#{a}#{options[:separator]}#{b}")
	end
	
	def my_number_to_currency(n, options={})
		number_to_currency(n.to_s.to_f, options)
	end
	
	def my_number_to_percentage(n, options={})
		number_to_percentage(n.to_s.to_f, options)
	end
	
	def my_number_with_precision(n, options={})
		number_with_precision(n.to_s.to_f, options)
	end
	
end
