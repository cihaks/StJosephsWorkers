class AssignedStatusTypesController < ApplicationController
  ajax_updates do |config|
		
	end
	
	before_filter :get_client
	
end
