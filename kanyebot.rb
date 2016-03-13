require 'slack-ruby-bot'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
  fail 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
end

class KanyeBot < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'pong', channel: data.channel)
  end
end

KanyeBot.run
