# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_StJosephsWorkers_session',
  :secret      => '09a880b8a2ee3d6706f4fd384edd60ad388533b8a0e566c17c99af4276551d4cc78dd5c8b525cf78e85dd8b48ac14a21a27cc66e87d9f61dadbf3abcb6c8b3be'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
