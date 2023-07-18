module Public::GamesHelper
  def players_range(min_players, max_players)
    if min_players == max_players
      "#{min_players}人"
    else
      "#{min_players}~#{max_players}人"
    end
  end
end
