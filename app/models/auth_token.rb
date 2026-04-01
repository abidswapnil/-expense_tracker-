class AuthToken < ApplicationRecord
  def self.generate_access_token(user, user_agent = nil)
    expiry = 1.month.from_now
    rand  = SecureRandom.hex(10)
    token = BCrypt::Password.create(rand)
    auth_key = AuthorizationKey.create!(authable: user,
                                        user_agent:,
                                        token:,
                                        expiry:,)
    {
      token: auth_key.token,
      expired_at: auth_key.expiry
    }
  end
end
