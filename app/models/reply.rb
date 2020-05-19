class Reply < ApplicationRecord
  validates :reply, {presence: true}

  belongs_to :comment

end
