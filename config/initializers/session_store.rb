# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rezept_db_session',
  :secret      => '678fe254699f97e95d71a1335403f284950b781ef1dfea7dbc777d4fc954b3d2ab991ec61f39ad6637411173cec7de364c306fe95eafbb7067753edbcfab429b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
