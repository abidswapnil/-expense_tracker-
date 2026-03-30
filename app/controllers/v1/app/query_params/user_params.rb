# frozen_string_literal: true

module V1::App::QueryParams
  module UserParams
    extend ::Grape::API::Helpers
    params :user_signup_params do
      requires :name, type: String, desc: "User name", allow_blank: false
      requires :email, type: String, desc: "User email", allow_blank: false
      requires :contact, type: String, desc: "User contact", allow_blank: false
      requires :password, type: String, desc: "User password", allow_blank: false
      requires :password_confirmation, type: String, desc: "User confirm password",allow_blank: false,
               same_as: { value: :password, message: "Password confirmation doesn't match" }

    end
  end
end
