class Request < ApplicationRecord

  belongs_to :user
  belongs_to :team

  enum status: { waiting: 0, approved: 1 }

end
