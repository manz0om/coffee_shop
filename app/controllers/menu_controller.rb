class MenuController < ApplicationController
  def show
    response = ResponseFormatter.new.get_menu
    render json: response, status: 200
  end
end
