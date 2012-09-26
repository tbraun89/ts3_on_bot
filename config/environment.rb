# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TS3OnBot::Application.initialize!

# Load the bots
require File.expand_path('../bots', __FILE__)

# Initialize the bots
Bots::Application.initialize!
