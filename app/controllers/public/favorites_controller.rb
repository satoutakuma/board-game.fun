class Public::FavoritesController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @favorite = Favorite.new(customer_id: current_customer.id, game_id: params[:game_id])
    @favorite.save!
    #   redirect_back(fallback_location: root_path, notice: "Liked the book.")
    # else
    #   redirect_back(fallback_location: root_path, alert: "Failed to like the book.")
    # end
  end

  def destroy
    @game = Game.find(params[:game_id])
    @favorite = Favorite.find_by(customer_id: current_customer.id, game_id: params[:game_id])
    @favorite.destroy!
    # redirect_back(fallback_location: root_path, notice: "Unliked the book.")
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end
end
