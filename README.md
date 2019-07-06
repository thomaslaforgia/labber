# LABBER

Scans for new/updated GitHub repositories and posts them to Slack.

## Getting started

- Set environment variables:

   `SLACK_API_TOKEN` Your bot token (create a bot [here](https://my.slack.com/services/new/bot))

   `SLACK_CHANNEL` Where to send reports (can be user ID, channel ID, etc.)

   `MONITORED_GITHUB_REPO` Search term to monitor (implementation still very crude!)

- `bundle install && rake db:migrate && rake db:setup`

## Usage

- `rake new_repos`

  Grabs new results and writes to DB

- `rake post_repos`

  Reports new results to Slack
