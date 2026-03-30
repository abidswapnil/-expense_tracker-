# frozen_string_literal: true

module V1::App::QueryParams
  module UserParams
    extend ::Grape::API::Helpers
    params :user_signup_params do
      requires :name, type: String, desc: "User name"
      requires :email, type: String, desc: "User email"
      requires :contact, type: String, desc: "User contact"
      optional :password, type: String, desc: "User password"
      optional :password_confirmation, type: String, desc: "User confirm password"
    end
  end
end
