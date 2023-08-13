class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :customer_id, null: false
      t.integer :game_id
      t.integer :max_players
      t.integer :min_players

      t.timestamps
    end
  end
end
