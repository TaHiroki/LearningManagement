class Subject < ApplicationRecord
  validates :subject, {presence: true}
  validates :count, presence: true, numericality: { greater_than_or_equal_to: 0 , only_integer: true }
  validates :flag, presence: true, numericality: { greater_than_or_equal_to: 0 , only_integer: true }

  belongs_to :user

end
