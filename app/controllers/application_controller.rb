class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
    def authenticate_user_through_provider!
      unless user_signed_in?
        redirect_to user_oauth_authorize_url(:provider)
      end
    end
end
