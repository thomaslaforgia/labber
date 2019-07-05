# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc "Checks for new monitored repos"
task :new_repos => :environment do
  GithubApi.check_for_new
end

desc "Post new repos to Slack"
task :post_repos => :environment do
  unreported = Repo.where(reported: !true)
  if unreported != []
    SlackClient.post(unreported.pluck(:url))
    unreported.map do |r|
      r.reported = true
      r.save
    end
  end
end
