class GithubApi < ActiveRestClient::Base
  base_url Rails.application.config.api_server_url

  get :repo_search, "/search/repositories"

  @monitored_repo = ENV['MONITORED_GITHUB_REPO']

  def self.latest_repos
    self.repo_search(q: @monitored_repo, sort: "updated")
  end

  def self.check_for_new
    self.latest_repos.items.each do |r|
      if not Repo.exists?(r.id)
        Repo.create(id: r.id, url: r.html_url, reported: false)
      end
    end
  end

end
