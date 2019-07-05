class SlackClient < ApplicationRecord
  def self.client
    Slack::Web::Client.new(token: ENV['SLACK_API_TOKEN'])
  end

  def self.channel
    ENV['SLACK_CHANNEL']
  end

  def self.format_message
    object_count = @object_array.length
    objects_string = @object_array.join("\n")
    "#{object_count} new #{'repo'.pluralize(object_count)}!\n#{objects_string}"
  end

  def self.post(object_array=[])
    @object_array = object_array
    self.client.chat_postMessage(
      channel: self.channel,
      text: self.format_message
    )
  end

end
