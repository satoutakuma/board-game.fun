class CreateGameReplies < ActiveRecord::Migration[6.1]
  def up
    create_table :game_replies do |t|
      t.references :game_comment, foreign_key: true
      t.references :customer, foreign_key: true
      t.text :comment
      t.timestamps
    end
  end

  def down
    drop_table :game_replies
  end
end
