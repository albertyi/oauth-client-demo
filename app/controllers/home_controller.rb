class HomeController < ApplicationController
  before_filter :authenticate_user_through_provider!

  def index
  end
end