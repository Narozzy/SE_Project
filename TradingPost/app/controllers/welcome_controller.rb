class WelcomeController < ApplicationController
  def index
    @listings = Listing.all
    @users = User.all
  end

  def show
  end
end
