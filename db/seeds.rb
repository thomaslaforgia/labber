# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

GithubApi.latest_repos.items.each do |r|
  # Set reported: true to avoid message flood
  Repo.create(id: r.id, url: r.html_url, updated_at: r.updated_at, reported: true)
end
