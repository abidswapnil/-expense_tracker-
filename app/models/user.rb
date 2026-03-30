class User < ApplicationRecord
  has_many :authorization_keys, as: :authable

  validates :name, :email, presence: true
  validates :contact, uniqueness: true, presence: true

  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end
