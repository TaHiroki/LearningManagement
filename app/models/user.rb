class User < ApplicationRecord
  has_secure_password
  has_one_attached :image
  
  validates :name, {presence: true}
  validates :email,{presence: true}
  validates :email,{uniqueness: true}
  validates :password,{presence: true}

  has_many :comments
end
