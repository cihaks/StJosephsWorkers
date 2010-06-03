module ClientsHelper
	def add_element_link(name, form_builder, association)
		new_object = form_builder.object.class.reflect_on_association(association).klass.new
    link_to_function name do |page|
      form_builder.fields_for association, new_object, :child_index => 'NEW_RECORD' do |f|
        html = render(:partial => "#{association.to_s}/form", :locals => { :f => f })
        page << "$('#{association.to_s}-element').insert({ bottom: '#{escape_javascript(html)}'.replace(/NEW_RECORD/g, new Date().getTime()) });"
      end
    end
  end
end
