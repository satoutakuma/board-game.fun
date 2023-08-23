class CreateGameReplies < ActiveRecord::Migration[6.1]
  def up
    create_table :game_replies do |t|
      t.integer :game_comment_id
      t.integer :customer_id
      t.text :comment
      t.timestamps
    end
  end

  def down
    drop_table :game_replies
  end
end
