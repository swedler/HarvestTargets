# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_harvesttargets_session',
  :secret      => '26e943d4ac19fc2dffad415ecc0a3befe034f92e8f3cd2b81159e4e8557a63868c58dff0ba98b9500cdd31101491b500c913c9110d59dc2294a5a02e3d3a29be'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
