# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # def new_path_string
  #     eval("new_client_#{controller.controller_name.singularize}_path(@client,@#{controller.controller_name.singularize})")
  #   end
  #   
  #   def edit_path_string
  #     eval("client_#{controller.controller_name.singularize}_path(@client,@#{controller.controller_name.singularize})")
  #   end
  #   
  #   def show_path_string
  #     eval("edit_client_#{controller.controller_name.singularize}_path(@client,@#{controller.controller_name.singularize})")
  #   end
  #   
  #   <% if controller.action_name=='index' %>
  #     <%= link_to 'New '+controller.controller_name.singularize.titleize, 
  #             eval("new_client_#{controller.controller_name.singularize}_path(@client,@#{controller.controller_name.singularize})") %>
  #   <% elsif controller.action_name == 'edit' %>
  #     <%= link_to 'Show', eval("client_#{controller.controller_name.singularize}_path(@client,@#{controller.controller_name.singularize})") %>
  #   <% elsif controller.action_name == 'show' %>
  #     <%= link_to 'Edit', eval("edit_client_#{controller.controller_name.singularize}_path(@client,@#{controller.controller_name.singularize})") %>
  #   <% end %>  
  
end
