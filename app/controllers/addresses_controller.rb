require 'ajax_updater'

class AddressesController < ApplicationController
  layout 'contacts_content'
  
  ajax_updates do |config|
    config.refresh_element 'contacts-element'
  end
  
  before_filter :get_client, :set_section

  def new_callback
    state = State.find_by_code('AZ')
    @address.state = state
    
    @primary_address = @client.addresses.find_by_address_type_id(AddressType.find(:first, :conditions => ['name like ?','%Primary%']))
  end

  def edit_callback
    
    @primary_address = @client.addresses.find_by_address_type_id(AddressType.find(:first, :conditions => ['name like ?','%Primary%']))
    
    if !@primary_address.nil?
      @primary_address = nil if @address.id == @primary_address.id
    end
  end

  # def create_callback_after
  #   # TODO:  update previous address and set end date???
  # end
  # 
  # def update_callback_after
  #   # TODO:  update previous address and set end date???
  # end
  # 
  # def destroy_callback_after
  #   # TODO:  check for existing current address???
  # end
  
  def set_section
    session[:contacts_section] = controller_name
  end
end
