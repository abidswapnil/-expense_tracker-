module V1::App
  class Users < V1::App::Base
    include QueryParams
    resources do
      get :signup do
        "sign up"
      end
    end
  end
end
