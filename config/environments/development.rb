# Settings specified here will take precedence over those in config/environment.rb

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = false

# Development environment uses populator and faker to generate test data
config.gem "populator"
config.gem "faker"

# Use custom renderer for pagination
WillPaginate::ViewHelpers.pagination_options[:renderer] = 'PaginateLinkRenderer'

#set default format for Calendar Date Select plugin
CalendarDateSelect.format = :american

CalendarDateSelect.default_options.update(
#     :popup => "force",
#     :month_year => "label",
#     :image => "custom_calendar_picker.png"
	:size=>"13"
)

# force ssl in entire app
USE_SSL = false

# name to display in banner on left
APP_NAME = 'St. Joseph the Worker - DEV'
