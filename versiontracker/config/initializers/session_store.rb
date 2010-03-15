# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_versiontracker_session',
  :secret      => '8e5ea7294f19b31dbe053452483140d1fd7f621de6fe0d57df64a136d4343e977f048f3170a8aff238c7854b69cf3b421c80cf5a28d4b458dbe5f92a39e7e305'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
