class WelcomeController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show
  end
end