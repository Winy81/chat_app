class ApplicationController < ActionController::Base

  include Modules::RedirectionSupport

  before_action :authenticate_user!

end
