class Comment < ApplicationRecord
  validates :comment, {presence: true}

  belongs_to :user
  has_many :replies
  has_one :fite
end
