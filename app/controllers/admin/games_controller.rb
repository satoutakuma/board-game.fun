class Admin::GamesController < ApplicationController
  def index
    @games = Game.joins(:customer).where(customers: { is_active: true })
    @user = current_customer
    if params[:min_players].present? || params[:max_players].present?
      @games = Game.where("min_players >= ? AND max_players <= ?", params[:min_players].to_i, params[:max_players].to_i).order(min_players: :asc)
    else
      @games = Game.page(params[:page]).per(10)
    end
  end
  def sort_by_players_range
    min_players = params[:min_players].to_i
    max_players = params[:max_players].to_i
    if min_players > 0 && max_players > 0
      @games = Game.where("min_players >= ? AND max_players <= ?", min_players, max_players).order(min_players: :asc)
    else
      @games = Game.all
    end
    render :index
  end

  def show
    @game = Game.find(params[:id])
    @new = Game.new

    @users = @game.customer
    @game_comment = GameComment.new
  end
  
  def destroy
    @game = Game.find(params[:id])
  	@game.destroy
  	redirect_to admin_games_path
  	flash[:notice] = "Game was successfully destroyed."
  end
  
  private
  def game_params
    params.require(:game).permit(:title, :body, :max_players, :min_players)
  end
end
