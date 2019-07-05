class CreateGithubApis < ActiveRecord::Migration[5.2]
  def change
    create_table :github_apis do |t|

      t.timestamps
    end
  end
end
