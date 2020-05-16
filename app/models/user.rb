class User < ApplicationRecord
  validates :name, {presence: true}
  validates :email,{presence: true}
  validates :email,{uniqueness: true}
  validates :password,{presence: true}
end
