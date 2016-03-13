require 'slack-ruby-client'
require 'dotenv'
require 'pry'
Dotenv.load

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
  raise 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
end

client = Slack::RealTime::Client.new

client.on :message do |data|
  user_hash = {}
  channels = {}
client.users.each{|k,v| user_hash[k["id"]] = k["name"]}
client.channels.each {|k,v| channels[k["name"]] = k["id"]}
binding.pry
  if data["channel"] == channels["bot-testing"] && data["text"] =~ /\:insult\:/
    client.web_client.chat_postMessage(channel: '#notifications', text: "#{user_hash[data["user"]]} is having fun")
  else
    puts data
  end
end
client.start!
