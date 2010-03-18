# Include hook code here
require 'ajax_updater'

ActionController::Base.send(:include, AjaxUpdater) 
