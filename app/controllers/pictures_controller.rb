class PicturesController < ApplicationController
  layout 'contacts_content'
  
  ajax_updates do |config|
    config.refresh_element 'contacts-element'
    config.add_refresh 'client-element', 'shared/client_show'
  end
  
  before_filter :get_client, :set_section
  
  # GET /pictures/new
  # GET /pictures/new.xml
  def new
    unless @client.pictures.empty?
      redirect_to edit_client_picture_path(@client, @client.pictures.first)
    end
    @picture = @client.pictures.build
  end

  # GET /pictures/1/edit
  def edit
    if @client.pictures.empty?
      redirect_to new_client_picture_path(@client)
    else
      @picture = @client.pictures.first
    end
  end

  # POST /pictures
  # POST /pictures.xml
  def create
    @picture = @client.pictures.new(params[:picture])

    respond_to do |format|
      if @picture.save
        flash[:notice] = 'Picture was successfully created.'
        format.html { redirect_to client_picture_path(@client) }
        format.xml  { render :xml => @picture, :status => :created, :location => @picture }
        format.js do
          responds_to_parent do
            render :update do |page|
              page.replace_html 'client-element', :partial=>'shared/client_show'
              page.replace_html 'contacts-element', :partial=>'pictures/index'
            end
          end
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @picture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.xml
  def update
    @picture = @client.pictures.find(params[:id])

    if @picture.update_attributes(params[:picture])
      flash[:notice] = 'Picture was successfully updated.'
      responds_to_parent do
        render :update do |page|
          page.replace_html 'client-element', :partial=>'shared/client_show'
          page.replace_html 'contacts-element', :partial=>'pictures/index'
        end
      end
    else
      render :action => "edit"
    end
  end
  
  def set_section
    session[:contacts_section] = controller_name
  end
  
end
