class GameReply < ApplicationRecord
  belongs_to :game_comment
  belongs_to :customer
end
