class Public::GameReplyController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @parent_comment = GameComment.find(params[:game_comment_id])
    @reply_comment = @parent_comment.replies.new(game_reply_params)
    @reply_comment.customer = current_customer

    if @reply_comment.save!
      redirect_to game_path(@game)
    else
      @new = Game.new
      @user = current_customer
      @users = @game.customer
      @game_comment = GameComment.new
      render "show"
    end
  end

  def destroy
    @reply = GameReply.find(params[:id])
  	@reply.destroy
  	redirect_to game_path(params[:game_id])
  end
  
  private
  def game_reply_params
    params.require(:game_reply).permit(:comment)
  end
end
