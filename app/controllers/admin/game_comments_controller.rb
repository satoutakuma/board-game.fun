class Admin::GameCommentsController < ApplicationController
  def destroy
    @game_comment = GameComment.find(params[:id])
    @game_comment.destroy
    redirect_to admin_game_path(@game_comment.game.id)
  end

  private

  def game_comment_params
    params.require(:game_comment).permit(:comment)
  end
end
