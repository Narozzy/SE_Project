class IndexController < ApplicationController
    def index
        @message="hey how are you"
        @listings = Listing.all
    end 
end
