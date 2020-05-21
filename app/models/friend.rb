class Friend < ApplicationRecord
  validates :master, {presence: true}
  validates :user_id, {presence: true}

  belongs_to :user
end
