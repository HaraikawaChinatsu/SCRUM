class Diary < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :diary_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  default_scope -> { order(date: :desc) }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
