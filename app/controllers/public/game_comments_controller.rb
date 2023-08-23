class Public::GameCommentsController < ApplicationController
  def create
    game = Game.find(params[:game_id])
    if current_customer
      comment = current_customer.game_comments.new(game_comment_params)
      comment.game_id = game.id
      if comment.save
        redirect_to game_path(params[:game_id])
      else
        redirect_to new_customer_session_path
      end
    else
      redirect_to new_customer_registration_path
    end
  end

  def destroy
    GameComment.find(params[:id]).destroy
    redirect_to game_path(params[:game_id])
  end

  private

  def game_comment_params
    params.require(:game_comment).permit(:comment)
  end
end

