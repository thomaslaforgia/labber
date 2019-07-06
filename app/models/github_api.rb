class GithubApi < ActiveRestClient::Base
  base_url Rails.application.config.api_server_url

  get :repo_search, "/search/repositories"

  @monitored_repo = ENV['MONITORED_GITHUB_REPO']
  @default_params = {'q': @monitored_repo, 'sort': 'updated', 'per_page': 50}

  before_request do |name, request|
    request.get_params = @default_params.merge(request.get_params)
  end

  def self.latest_repos(params={})
    self.repo_search(params)
  end

  def self.check_for_new
    self.latest_repos.items.each do |r|
      if not Repo.exists?(r.id)
        Repo.create(id: r.id, url: r.html_url, updated_at: r.updated_at, reported: false)
      end
    end
  end

end
