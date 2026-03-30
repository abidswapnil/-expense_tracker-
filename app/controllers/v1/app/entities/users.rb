module V1::App::Entities
  class Users < Grape::Entity
    expose :name
    expose :email
    expose :contact
  end
end
