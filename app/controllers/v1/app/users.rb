module V1::App
  class Users < V1::App::Base
    helpers V1::App::QueryParams::UserParams
    resources do
      params do
        use :user_signup_params
      end
      post :signup do
        # password_hash = generate_password_hash(params[:password])
        user = User.create(params)
        V1::App::Entities::Users.represent(user)
      rescue StandardError => e
        error!(e.message, 400)
      end
    end
  end
end
