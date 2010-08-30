module Acts
  module DomainBasedAssociation
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
  #     def acts_as_domain_based_association(options = {}, &block)
  #       include Acts::DomainBasedAssociation::InstanceMethods
  #       extend Acts::DomainBasedAssociation::SingletonMethods
  #       
  #       cattr_accessor :configuration
  # 
  #       self.configuration = {
  #         :domain_type => "",
  #         :associations => []
  #       }
  # 
  #       def domain_type ( dtype = '' )
  #         self.configuration[:domain_type] = dtype
  #       end
  # 
  #       def associations(*associations)
  # 					assoc_array = associations.to_ary
  #         self.configuration[:associations] = assoc_array
  #       end
  # 
  #       self.module_eval &block if block_given?
  # 
  # 				do_config
  #       
      end
  # 
  # 			private
  # 			
  # 			def do_config
  # 				# set up domain type relationship
  # 				eval("belongs_to :#{configuration[:domain_type]}")
  # 				eval("#{configuration[:domain_type].to_s.camelize}.class_eval(\"has_many :#{self.class_name.underscore.pluralize}\")")
  # 				
  # 				define_method "domain_type" do
  # 					"#{configuration[:domain_type].to_s}"
  # 				end
  # 				
  # 				configuration[:associations].each do |assoc|
  # 					# set up association relationship
  # 					eval("has_one :#{assoc}, :dependent=>:destroy")
  # 					eval("#{assoc.to_s.camelize}.class_eval(\"belongs_to :#{self.class_name.underscore}\")")
  # 					
  # 					define_method "my_#{assoc}=" do |some_attributes|
  # 					  eval("if self.#{assoc}.nil?
  # 		          some_attributes.each do |attributes|
  # 		            self.build_#{assoc}(attributes)
  # 		          end unless some_attributes.nil?
  # 		        else
  # 		          attributes = some_attributes[self.#{assoc}.id.to_s] unless some_attributes.nil?
  # 		          if attributes
  # 		            self.#{assoc}.attributes = attributes
  # 		          end
  # 		        end")
  # 					end
  # 			  end
  # 			  
  # 			  # add methods for saving association objects
  # 				eval("after_save :save_associations")
  # 				
  # 			  define_method "save_associations" do
  # 					if eval("!#{configuration[:domain_type].to_s}.type_name.nil?")
  # 					  configuration[:associations].each do |assoc|
  # 						  eval("#{assoc}.delete if #{assoc} and !\"#{assoc}\".downcase.eql?(#{configuration[:domain_type].to_s}.type_name.downcase)")
  # 						end
  # 					else
  # 						configuration[:associations].each do |assoc|
  # 							eval("#{assoc}.delete")
  # 						end
  # 			    end
  # 				end
  # 				
  # 				
  # 				eval("#{(self.class_name.underscore.pluralize+'_controller').camelize.constantize}.class_eval(\"define_method \\\"set_domain_association\\\" do 
  # 					  @current_type = #{configuration[:domain_type].to_s.camelize}.find(params[:#{self.class_name.underscore}][:#{configuration[:domain_type].to_s}_id])  
  # 					  if !@current_type.type_name.nil? 
  # 					    #{get_domain_assoc_string}
  # 				    end 
  # 				  end\")
  # 				")
  # 				
  # 		  end
  # 		
  # 		  def get_domain_assoc_string
  # 				s = ""
  # 				configuration[:associations].each do |assoc|
  # 				   s << "params[:#{self.class_name.underscore}][:my_#{assoc}] ||={} if \\\"#{assoc}\\\".downcase.eql?(@current_type.type_name.downcase)\n"
  # 				   s << "params[:#{self.class_name.underscore}][:my_#{assoc}] = {} unless \\\"#{assoc}\\\".downcase.eql?(@current_type.type_name.downcase)\n"
  # 				   s << "\n"
  # 		 		end
  # 				s
  # 			end
  #   end
  # 
  #   module SingletonMethods
  #     # Add class methods here
  #   end
  # 
  #   module InstanceMethods
  #     # Add instance methods here
  #   end
  # 
  end
end

# %w{ helpers }.each do |dir| 
# 	path = File.join(File.dirname(__FILE__), 'app', dir)  
# 	$LOAD_PATH << path 
# 	ActiveSupport::Dependencies.load_paths << path 
# 	# ActiveSupport::Dependencies.load_once_paths.delete(path) 
# end 

