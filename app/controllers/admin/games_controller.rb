class Admin::GamesController < ApplicationController
  def index
    @games = Game.page(params[:page]).per(10)
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    flash[:notice] = "会員情報を変更しました。"
    redirect_to admin_customer_path
  end
  private
  def game_params
    params.require(:game).permit(:name, :email, :is_active)
  end
end
