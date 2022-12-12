class ApplicationController < ActionController::Base
  rescue_from Exceptions do |exception|
    render json: { success: false, message: exception.to_s }, status: 500
  end
end
