# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# This was the only line in the file:   (afshin)
# SampleApp::Application.config.secret_key_base = 'f5d270fa1193a2063092d179f4ef3e178fd998b00e8a02a95fe5ded190108b5d8648d52d3a592691a1330ecd3530d695957231955bcfce29fd2f9e007f9eea15'

# This is from Hartl's book, Listing 3.2:
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

SampleApp::Application.config.secret_key_base = secure_token