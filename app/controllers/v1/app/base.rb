module V1::App
  class Base < Grape::API
    format "json"
    prefix :user
    formatter :json, Grape::Formatter::Json

    include Grape::Kaminari

    # require "bcrypt"
    #
    # def generate_password_hash(password)
    #   BCrypt::Password.create(password)
    # end

    # All mount
    mount V1::App::Users

  end
end
