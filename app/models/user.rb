class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :diaries, dependent: :destroy
  has_many :diary_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one :team_member
  # 自分が所属しているチーム
  has_one :team, through: :team_member
  # 自分が作成したチーム
  has_one :created_team, class_name: 'Team', dependent: :destroy
  has_many :requests

  attachment :image

  def graph
    default_scope -> { order(date: :asc) }
  end


end
