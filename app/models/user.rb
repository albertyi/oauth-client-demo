class User < ActiveRecord::Base
  devise :oauthable

  def self.find_for_provider_oauth(access_token, signed_in_resource = nil)
    data = ActiveSupport::JSON.decode(access_token.get('/oauth/user'))["user"]
    user = User.find_by_username(data["username"])
    
    if user.nil?
      user = User.create(data)
    end
  end
end
