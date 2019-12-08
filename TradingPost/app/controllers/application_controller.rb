class ApplicationController < ActionController::Base
  include Clearance::Controller
  include Clearance::Authentication
end
