require 'slack-ruby-client'
require 'dotenv'
require 'pry'
Dotenv.load
Slack.configure do |config|
  config.token = ENV['TOKEN']
end

client = Slack::Web::Client.new
