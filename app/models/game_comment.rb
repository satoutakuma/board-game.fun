class GameComment < ApplicationRecord
  belongs_to :customer
  belongs_to :game
  has_many :replies, class_name: 'GameReply', foreign_key: 'game_comment_id', dependent: :destroy
end
