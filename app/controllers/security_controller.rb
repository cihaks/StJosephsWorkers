class SecurityController < ApplicationController
  require_role :admin
	layout 'references'

	# GET list method for sub-classed controllers
  def index
	  eval("@#{controller_name} = #{controller_name.classify}.search(params[:query],params[:page],current_user.admin_list_limit)")
		
		index_callback
    
		respond_to do |format|
      format.html # index.html.erb
      format.js { render :layout=>false }
      format.xml  { render :xml => eval("@#{controller_name}") }
    end
  end
	
	def index_list
		eval("@#{controller_name} = #{controller_name.classify}.search(params[:query],params[:page],current_user.admin_list_limit)")
	end
	
	# GET by id method for sub-classed controllers
  def show
		eval("@#{controller_name.singularize} = #{controller_name.classify}.find(params[:id])")
		
		show_callback
		
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => eval("@#{controller_name.singularize}") }
    end
  end
	
	# GET new method for sub-classed controllers
  def new
		eval("@#{controller_name.singularize} = #{controller_name.classify}.new")
		
		new_callback
		
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => eval("@#{controller_name}") }
    end
  end

  # GET /{controller}/1/edit
  def edit
		eval("@#{controller_name.singularize} = #{controller_name.classify}.find(params[:id])")
    
		edit_callback
  end

  # POST /agencies
  # POST /agencies.xml
  def create
		eval("@#{controller_name.singularize} = #{controller_name.classify}.new(params[:#{controller_name.singularize}])")
		
		create_callback_before_save
		
    respond_to do |format|
      if eval("@#{controller_name.singularize}.save")
				create_callback_after_save
				eval("@#{controller_name} = #{controller_name.classify}.search(params[:query],params[:page],current_user.admin_list_limit)")
        flash[:notice] = "#{controller_name.singularize.humanize.titleize}" + ' was successfully created.'
        format.html { redirect_to( eval("#{controller_name}_url") ) }
        format.xml  { render :xml => eval("@#{controller_name.singularize}"), :status => :created, :location => eval("@#{controller_name.singularize}") }
				format.js { render :action => "index" }
				# 					render :update do |page|
				# 							controller.index_list
				# 						  page.replace_html "item-list", :partial=>'index'
				# 					end
				# 				end
      else
				create_callback_after_error
				errors = eval("@#{controller_name.singularize}.errors")
				flash[:errors] = eval("@#{controller_name.singularize}.errors")
        format.html { render :action => "new" }
        format.xml  { render :xml => eval("@#{controller_name.singularize}.errors"), :status => :unprocessable_entity }
				format.js do
					render :update do |page|
						errors.collect do |e, m|
				      page.replace_html "#{controller_name.singularize}.#{e}-error", :text=>"  "+m unless e.nil? or m.nil?
				    end
					end
				end
      end
    end
  end

  # PUT /agencies/1
  # PUT /agencies/1.xml
  def update
		eval("@#{controller_name.singularize} = #{controller_name.classify}.find(params[:id])")
		
		update_callback_before_save
		
    respond_to do |format|
      if eval("@#{controller_name.singularize}.update_attributes(params[:#{controller_name.singularize}])")
				update_callback_after_save
        flash[:notice] = "#{controller_name.singularize.humanize.titleize}" + ' was successfully updated.'
        format.html { redirect_to( eval("#{controller_name}_url") ) }
        format.xml  { head :ok }
      else
				update_callback_after_error
				errors = eval("@#{controller_name.singularize}.errors")
				flash[:errors] = eval("@#{controller_name.singularize}.errors")
        format.html { render :action => "edit" }
        format.xml  { render :xml => eval("@#{controller_name.singularize}.errors"), :status => :unprocessable_entity }
				format.js do
					render :update do |page|
						errors.collect do |e, m|
				      page.replace_html e+"-error", :text=>"  "+m unless e.nil? or m.nil?
				    end
					end
				end
      end
    end
  end

  # DELETE /agencies/1
  # DELETE /agencies/1.xml
  def destroy
    eval("@#{controller_name.singularize} = #{controller_name.classify}.find(params[:id])")
		
		destroy_callback_before_object
		
    eval("@#{controller_name.singularize}.destroy")
		
		destroy_callback
		
    respond_to do |format|
      format.html { redirect_to( eval("#{controller_name}_url") ) }
      format.xml  { head :ok }
    end
  end

	def method_missing(name, *args)
    unless name.to_s.include? "callback"
      super
    end
  end
end
