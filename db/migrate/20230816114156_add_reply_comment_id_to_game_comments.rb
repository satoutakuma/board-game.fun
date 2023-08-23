class AddReplyCommentIdToGameComments < ActiveRecord::Migration[6.1]
  def change
    add_column :game_comments, :reply_comment_id, :integer
  end
end
