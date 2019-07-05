class SlackClient < ApplicationRecord
  def self.client
    Slack::Web::Client.new(token: ENV['SLACK_API_TOKEN'])
  end

  def self.channel
    ENV['SLACK_CHANNEL']
  end

  def self.format_message(text)
    "New lab available!\n#{text}"
  end

  def self.post_to_channel(text)
    self.client.chat_postMessage(
      channel: self.channel,
      text: self.format_message(text)
    )
  end

end
