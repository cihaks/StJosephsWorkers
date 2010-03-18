# Include hook code here

# include code for domain objects
require 'acts_as_domain_based_association'
ActiveRecord::Base.send :include, Acts::DomainBasedAssociation

# add helpers
require "fields_for_helper" 
ActionView::Base.send :include, FieldsForHelper

# base = User
# type = UserType
# associations = Manager, Underwriter, Technologist


