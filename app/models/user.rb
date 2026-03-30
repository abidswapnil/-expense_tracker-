class User < ApplicationRecord
  include AuthValidation

  has_many :authorization_keys, as: :authable, dependent: :destroy

  validates :name, :email, presence: true
  validates :contact, uniqueness: true, presence: true

end
