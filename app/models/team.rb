class Team < ApplicationRecord
  has_many :team_members
  has_many :users, through: :team_members
  # チームキャプテンとなるのユーザー
  belongs_to :user
  has_many :requests
  has_many :tags, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  attachment :image

  validates :minimum_people, numericality: { greater_than_or_equal_to: 1, message: '1人以上必要です。' } # 数字が1以上であるか
  validates :max_people, numericality: { greater_than_or_equal_to: 2, message: '2人以上必要です。' }  # 数字が2以上であるか

  def my_team?(my_user_id)
    my_user_id == user_id
  end

  def average_weight()
    weight = 0.0
    self.team_members.each do |team_member|
      weight += team_member.user.weight
    end
    return (weight / self.team_members.count).floor(2).to_f
  end
end
