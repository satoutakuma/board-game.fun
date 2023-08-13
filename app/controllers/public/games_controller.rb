class Public::GamesController < ApplicationController
  include Public::GamesHelper
  before_action :is_matching_login_customer, only: [:edit, :update]
  def new
    @game = Game.new
  end
  def create
    @game = Game.new(game_params)
    @game.customer_id = current_customer.id
    if @game.save
      flash[:notice] = "game was successfully created."
      redirect_to game_path(@game)
    else
      #flash[:notice] = "error Book was not successfully created."
      @games = Game.all
      @customer = current_customer
      render :index
    end
  end

  def index
    @games = Game.all
    @user = current_customer
    if params[:min_players].present? && params[:max_players].present?
      @games = @games.where("min_players <= ? AND max_players >= ?", params[:max_players], params[:min_players])
    end
  end

  def sort_by_players_range
    min_players = params[:min_players].to_i
    max_players = params[:max_players].to_i

    if min_players > 0 && max_players > 0
      @games = Game.where("min_players <= ? AND max_players >= ?", max_players, min_players).order(min_players: :asc)
    else
      @games = Game.all
    end

    render :index
  end

  def create_reply
    @game = Game.find(params[:id])
    @parent_comment = GameComment.find(params[:game_comment_id])
    @reply_comment = @parent_comment.replies.new(game_comment_params)
    @reply_comment.customer = current_customer

    if @reply_comment.save
      redirect_to game_path(@game)
    else
      @new = Game.new
      @user = current_customer
      @users = @game.customer
      @game_comment = GameComment.new
      render "show"
    end
  end

  def show
    @game = Game.find(params[:id])
    @new = Game.new
    @user = current_customer
    @users = @game.customer
    @game_comment = GameComment.new
  end

  def edit
    is_matching_login_customer
    @game = Game.find(params[:id])
  end

  def update
    is_matching_login_customer
    @game = Game.find(params[:id])
    if @game.update(game_params)
      flash[:notice] = "game was successfully updated."
      redirect_to game_path(@game)
    else
      flash[:notice] = "error game was not successfully updated."
      @games = Game.all
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:id])
  	@game.destroy
  	redirect_to games_path
  	flash[:notice] = "Game was successfully destroyed."
  end

  private
  def game_params
  	params.require(:game).permit(:title, :body, :max_players, :min_players)
  end
  def game_comment_params
    params.require(:game_comment).permit(:comment, :game_comment)
  end

  def is_matching_login_customer
    game = Game.find(params[:id])
    unless game.customer == current_customer
      redirect_to games_path
    end
  end
end
