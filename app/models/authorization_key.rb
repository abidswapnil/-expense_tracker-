class AuthorizationKey < ApplicationRecord
  belongs_to :authable, polymorphic: true
end
