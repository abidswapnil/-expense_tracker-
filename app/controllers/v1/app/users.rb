module V1::App
  class Users < App::Base
    resources do
      get do
        "test API"
      end
    end
  end
end
