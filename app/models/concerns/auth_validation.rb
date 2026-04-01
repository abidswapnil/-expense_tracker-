module AuthValidation
  extend ActiveSupport::Concern
  include BCrypt

  included do
    validates :password, confirmation: true, on: :create
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
