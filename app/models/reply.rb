class Reply < ApplicationRecord
  validates :reply, {presence: true}
  validates :user_id, {presence: true}

  belongs_to :comment
  belongs_to :user
end
