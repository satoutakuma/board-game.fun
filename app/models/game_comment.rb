class GameComment < ApplicationRecord
  belongs_to :customer
  belongs_to :game
  has_many :replies, class_name: 'GameReply', dependent: :destroy
end
