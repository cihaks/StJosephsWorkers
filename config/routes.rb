ActionController::Routing::Routes.draw do |map|
  map.resources :educations

  map.resources :convictions

  map.resources :shelters


  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new', :conditions => { :method => :get }
  map.connect '/login', :controller => 'sessions', :action => 'create', :conditions => { :method => :post }
  map.home '/home', :controller => 'home', :action=> 'index'
  map.root :login
  
  map.resources :users
  map.resource  :session
  map.resources :profiles
  map.resources :roles

  map.resources :activity_logs
  map.resources :address_types
  map.resources :agency_types
  map.resources :agencies
  map.resources :benefits_types
	map.resources :course_attendances
  map.resources :companies
  map.resources :contact_types
  map.resources :courses
  map.resources :crime_types
  map.resources :incarceration_lengths
  map.resources :industries
  map.resources :job_types
  map.resources :races
  map.resources :resource_types
  map.resources :prisons
  map.resources :states
  map.resources :status_types
  map.resources :substances

  map.resources :clients, :has_many => [:assigned_agencies,:contacts,:phones,:pictures,
                                        :assigned_resources,:jobs,:used_substances,:addresses,
                                        :job_applications, :job_interviews, 
                                        :contacts,:registered_classes,:crime_sentences]

  map.resources :job_rates  #add to jobs route....

  
  map.reports 'reports', :controller => 'reports'

  
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
