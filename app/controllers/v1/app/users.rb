module V1::App
  class Users < V1::App::Base
    helpers V1::App::QueryParams::UserParams
    resources do
      desc "User sign up"
      params do
        use :user_signup_params
      end
      post :signup do
        user = User.find_or_initialize_by(contact: params[:contact])
        if user.persisted?
          error!("User already exists!", :conflict)
        end
        user.assign_attributes(params)
        if user.save!
          {
            message: "Sign up successful!",
            user: V1::App::Entities::Users.represent(user),
            auth_token: AuthToken.generate_access_token(user, @request_user_agent)
          }
        end
      rescue StandardError => e
        error!(e.message, :bad_request)
      end

      desc "User sign in"

      params do
        requires :contact, type: String, desc: "User contact"
        requires :password, type: String, desc: "User password"
      end

      post :signin do
        user = User.find_by_contact(params[:contact])
        error!("User not registered!", :not_found) unless user
        error!("Invalid password!") unless user.password == params[:password]
        if user.persisted?
          AuthToken.generate_access_token(user, @request_user_agent)
        end
      rescue StandardError => e
        error!(e.message, :bad_request)
      end

    end
  end
end
