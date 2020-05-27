class Subject < ApplicationRecord
  validates :subject, {presence: true}
  validates :count, {presence: true}

  belongs_to :user
end
