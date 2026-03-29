module V1::App
  class Base < Grape::API
    format "json"
    prefix :user
    formatter :json, Grape::Formatter::Json

    include Grape::Kaminari

    # All mount
    mount V1::App::Users

  end
end
