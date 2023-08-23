class AddReplyCommentIdToGameComments < ActiveRecord::Migration[6.1]
  def change
    add_column :game_comments, :reply_comment_id, :integer
    add_foreign_key :game_comments, :game_comments, column: :reply_comment_id
  end
end
