module Acts
  module DomainBasedAssociation
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def acts_as_domain_based_association(options = {}, &block)
        include Acts::DomainBasedAssociation::InstanceMethods
        extend Acts::DomainBasedAssociation::SingletonMethods
        
        cattr_accessor :configuration

        self.configuration = {
          :domain_type => "",
          :associations => []
        }

        def domain_type ( dtype = '' )
          self.configuration[:domain_type] = dtype
        end

        def associations(*associations)
					assoc_array = associations.to_ary
          self.configuration[:associations] = assoc_array
        end

        self.module_eval &block if block_given?

				do_config
        
      end

			private
			
			def do_config
				# set up domain type relationship
				eval("belongs_to :#{configuration[:domain_type]}")
				eval("#{configuration[:domain_type].to_s.camelize}.class_eval(\"has_many :#{self.class_name.underscore.pluralize}\")")
				
				configuration[:associations].each do |assoc|
					# set up association relationship
					eval("has_one :#{assoc}, :dependent=>:destroy")
					eval("#{assoc.to_s.camelize}.class_eval(\"belongs_to :#{self.class_name.underscore}\")")
					
					# add methods for saving association objects
					eval("after_save :save_#{assoc}")
				  
					define_method "my_#{assoc}=" do |some_attributes|
					  eval("if self.#{assoc}.nil?
		          some_attributes.each do |attributes|
		            self.build_#{assoc}(attributes)
		          end unless some_attributes.nil?
		        else
		          attributes = some_attributes[self.#{assoc}.id.to_s] unless some_attributes.nil?
		          if attributes
		            self.#{assoc}.attributes = attributes
		          else
		            self.#{assoc}.delete
		          end
		        end")
					end

					define_method "save_#{assoc}" do
						eval("self.#{assoc}.save unless self.#{assoc}.nil?")
					end
				  
			  end
				
				# # add helper methods
				# eval("#{(self.class_name.underscore.pluralize+'_helper').camelize.constantize}.module_eval(\"extend Acts::FieldsForHelper\")")
				
				# eval("#{(self.class_name.underscore.pluralize+'_controller').camelize.constantize}.send(\"helper :fields_for\")")
				
		  end
    end

    module SingletonMethods
      # Add class methods here
    end

    module InstanceMethods
      # Add instance methods here
    end

  end
	# 
	#   module FieldsForHelper
	# 	def fields_for_association(domain, association_name, &block)
	# 	  prefix = "my" 
	# 	  object = eval("domain.new_record? ? domain.build_#{association_name} : domain.#{association_name}.nil? ? domain.build_#{association_name} : domain.#{association_name}")
	# 	  fields_for("#{domain.class_name.underscore}[#{prefix}_#{association_name}][]", object, &block)
	# 	end
	# end
		# 
		# module ControllerKeys
		# 	# set up keys for associations
		# 	# create assignment to association model from user types
		# 	# can do this by setting up a column in database for user types that assigns to association
		# 				
		# 				def set_domain_association
		# 			    get_keys
		# 			    case params[:assigned_resource][:resource_type_id]
		# 			      when @daily_pass_key.id.to_s
		# 			        params[:assigned_resource][:my_daily_pass] ||= {}
		# 			        params[:assigned_resource][:my_monthly_pass] = nil
		# 			        params[:assigned_resource][:my_voice_mail] = nil
		# 			      when @monthly_pass_key.id.to_s
		# 			        # params[:assigned_resource][:monthly_pass] ||= {}
		# 			        params[:assigned_resource][:new_daily_pass] = nil
		# 			        params[:assigned_resource][:voice_mail] = nil
		# 			      when @voice_mail_key.id.to_s
		# 			        params[:assigned_resource][:voice_mail] ||= {}
		# 			        params[:assigned_resource][:new_daily_pass] = nil
		# 			        params[:assigned_resource][:monthly_pass] = nil
		# 			    end
		# 			  end
		# 	
		# end
end

# %w{ helpers }.each do |dir| 
# 	path = File.join(File.dirname(__FILE__), 'app', dir)  
# 	$LOAD_PATH << path 
# 	ActiveSupport::Dependencies.load_paths << path 
# 	# ActiveSupport::Dependencies.load_once_paths.delete(path) 
# end 

