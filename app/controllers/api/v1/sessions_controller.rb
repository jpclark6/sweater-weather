class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: { api_key: user.api_key }
    else
      render json: { "status": "Login failed." }
    end
  end
end
