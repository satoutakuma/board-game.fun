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
  end

  def show
    @game = Game.find(params[:id])
    @new = Game.new
    @user = current_customer
    @users = @game.customer
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

  def is_matching_login_customer
    game = Game.find(params[:id])
    unless game.customer == current_customer
      redirect_to games_path
    end
  end
end
