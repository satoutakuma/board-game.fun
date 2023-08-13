class Game < ApplicationRecord
  belongs_to :customer
  has_many :favorites, dependent: :destroy
  has_many :game_comments
  has_many :replies, class_name: 'GameComment', foreign_key: :reply_comment_id, dependent: :destroy
  has_one_attached :image

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end

  def favorited_by?(customer)
    favorites.present? && favorites.exists?(customer_id: customer.id)
  end
end
