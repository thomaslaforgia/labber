class CreateSlackClients < ActiveRecord::Migration[5.2]
  def change
    create_table :slack_clients do |t|

      t.timestamps
    end
  end
end
