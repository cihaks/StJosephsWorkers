require 'ajax_updater'

class ContactsController < ApplicationController
  layout 'contacts_content'
  
  ajax_updates do |config|
    config.refresh_element 'contacts-element'
    config.add_refresh 'client-element', 'shared/client_show'
    config.skip_refresh 'create', 'Office Visit was successfully added'  #skips refresh when office visit only added
    config.section 'contacts_section'
  end
  
  before_filter :get_client, :set_section
  
  # override ajax_updater index method because of the custom layout options
  # GET /contacts
  # GET /contacts.xml
  def index
    
    session[:show_all_contacts] = 1 if params[:show_all_contacts]=='true'
    session[:show_all_contacts] = 0 if params[:show_all_contacts]=='false'
    
    respond_to do |format|
      format.html # index.html.erb
      format.js { render :layout => false unless params[:show_all_contacts].nil? }
      format.xml  { render :xml => @contacts }
    end
  end
end
