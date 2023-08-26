class Admin::GameReplyController < ApplicationController
  def destroy
    @reply = GameReply.find(params[:id])
  	@reply.destroy
  	redirect_to admin_game_path(@reply.game_comment.game.id)
  end

  private
  def game_reply_params
    params.require(:game_reply).permit(:comment)
  end
end
