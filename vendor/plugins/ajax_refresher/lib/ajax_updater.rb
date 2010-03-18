module AjaxUpdater 
  def self.included(base)  
    base.send :extend, ClassMethods 
  end  
  
  module ClassMethods 
    def ajax_updates(options = {}, &block)
      extend SingletonMethods
      include InstanceMethods
      
      cattr_accessor :configuration
      
      self.configuration = {
        :elements => [{ :element => 'client-updates', :partial => 'shared/client_updates' }],
        :skip_methods => {},
        :section => ''
      }
      
      def add_refresh ( element = '', partial = '' )
        self.configuration[:elements] << { :element => element, :partial => partial }
      end
      
      def skip_refresh ( method = '', alert = ' ')
        eval("self.configuration[:skip_methods][:#{method}] = '#{alert}'")
      end
      
      def refresh_element(element = '')
        self.configuration[:elements] << { :element => element, :partial => eval("'#{controller_name}/index'") }
      end
      
      def section(section = '')
        self.configuration[:section] = section
      end
      
      self.module_eval &block if block_given?
      
      #TODO add name , args as hash to configuration in method missing
      # def method_missing(name, *args)
      # end
      
    end  
  end
  
  module SingletonMethods
  end
  
  module InstanceMethods 
    # GET /controller_name
    # GET /controller_name.xml
    def index
      # eval("@#{controller_name} = @client.#{controller_name}.all")
      
      index_callback

      respond_to do |format|
        format.js # { render :layout=>false }  # need to have option to not use layout contacts?
        format.html # index.html.erb
        format.xml  { render :xml => @contacts }
      end
    end
    
    # GET /controller_name/1
    # GET /controller_name/1.xml
    def show
      eval("@#{controller_name} = @client.#{controller_name}.find(params[:id])")
      
      show_callback

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @contact }
      end
    end

    # GET /controller_name/new
    # GET /controller_name/new.xml
    def new
      eval("@#{controller_name.singularize} = @client.#{controller_name}.build")
      
      new_callback
      
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @contact }
      end
    end

    # GET /controller_name/1/edit
    def edit
      eval("@#{controller_name.singularize} = @client.#{controller_name}.find(params[:id])")
      
      edit_callback
      
      respond_to do |format|
        format.html # edit.html.erb
        format.xml  { render :xml => @contact }
      end
    end
    
    def create
      elements = get_elements
      skip_message = skip_message('create')
      
      create_callback_before_object
      
      @object_to_create = eval("@client.#{controller_name}.new(params[:#{controller_name.singularize}])")
      
      create_callback_before

      respond_to do |format|
        if @object_to_create.save
          
          create_callback_after
          
          flash[:notice] = "#{controller_name.singularize.humanize.titleize}" + ' was successfully created.'
          format.html { redirect_to( eval("client_#{controller_name}_path(@client)") ) }
          format.xml  { render :xml => @object_to_create, :status => :created, :location => @object_to_create }
          format.js do
            render :update do |page|
              if !params[:page_update].nil? and params[:page_update] == 'false' and !skip_message.nil?
                page.alert(skip_message) unless skip_message == ' '
              else
                elements.each do |element|
                  page.replace_html element[:element], :partial=>element[:partial]
                end
              end
            end
          end
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @object_to_create.errors, :status => :unprocessable_entity }
        end
      end
    end
    
    def update
      elements = get_elements
      skip_message = skip_message('create')
      
      update_callback_before_object
      
      @object_to_update = eval("@client.#{controller_name}.find(params[:id])")
      
      update_callback_before
        
      respond_to do |format|
        if @object_to_update.update_attributes(eval("params[:#{controller_name.singularize}]"))
          
          update_callback_after
          
          flash[:notice] = "#{controller_name.singularize.humanize.titleize}" + ' was successfully updated.'
          format.html { redirect_to( eval("client_#{controller_name}_path(@client)") )}
          format.xml  { head :ok }
          format.js do
            render :update do |page|
              if !params[:page_update].nil? and params[:page_update] == 'false' and !skip_message.nil?
                page.alert(skip_message) unless skip_message == ' '
              else
                elements.each do |element|
                  page.replace_html element[:element], :partial=>element[:partial]
                end
              end
            end
          end
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @object_to_update.errors, :status => :unprocessable_entity }
        end
      end
    end
    
    # DELETE /controller_name/1
    # DELETE /controller_name/1.xml
    def destroy
      elements = get_elements
      eval("@#{controller_name.singularize} = @client.#{controller_name}.find(params[:id])")
      
      destroy_callback_before
      
      eval("@#{controller_name.singularize}.destroy")
  
      destroy_callback_after
  
      respond_to do |format|
        format.html { redirect_to(@client) }
        format.xml  { head :ok }
        format.js do
          render :update do |page|
            elements.each do |element|
              page.replace_html element[:element], :partial=>element[:partial]
            end
          end
        end
      end
    end
    
    def get_client
      unless params[:client_id].nil? 
        @client = Client.find(params[:client_id])
        @alerts = @client.contacts.find( :all, :conditions=>"alert = true" ) unless @client.nil?
        @activity_logs = ActivityLog.search(@client.id, 5)
        eval("@#{controller_name.singularize} = @client.#{controller_name}.find(params[:id]) unless params[:id].nil?")
      end
    end
    
    def method_missing(name, *args)
      unless name.to_s.include? "callback"
        super
      end
    end
    
    def set_section
      eval("session[:#{get_section}] = controller_name")
    end
  end
  
  private
  
  def skip_message(method = '')
    eval("self.configuration[:skip_methods][:#{method}]")
  end
  
  def get_elements
    configuration[:elements]
  end
  
  def get_section
    configuration[:section]
  end
end
