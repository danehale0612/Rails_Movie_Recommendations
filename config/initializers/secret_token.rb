# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
if Rails.env.development? or Rails.env.test?
  RailsMovieRec::Application.config.secret_token = 'b993f1c4f945b2c40e2ae6a00efd47b0dca9dfeade9783da371fb6b1648fbb9b79036ecd8d84bf4c7f5681ed8ddcf9eebc3c700ab07632547761ebdbc4ab8c37'
else
  RailsMovieRec::Application.config.secret_token = ENV['SECRET_TOKEN']
end
