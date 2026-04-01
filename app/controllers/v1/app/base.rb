module V1::App
  class Base < Grape::API
    format "json"
    prefix :user
    formatter :json, Grape::Formatter::Json

    include Grape::Kaminari

    def set_user_agent
      @request_user_agent = request.headers.fetch("User-Agent")
    end



    def authenticate!

    end

    def bearer_token
      @bearer_token = request
    end


    # All mount
    mount V1::App::Users

  end
end
