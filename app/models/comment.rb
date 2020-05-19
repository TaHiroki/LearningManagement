class Comment < ApplicationRecord
  validates :comment, {presence: true}

  belongs_to :user
  has_many :replies
end
