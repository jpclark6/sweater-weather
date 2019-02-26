class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: { "api_key": user.api_key }, status: 201
    else
      render json: { "status": "Account not created. Error occured." }
    end
  end

  private

  def user_params
    {
      email: params[:email], 
      password: params[:password], 
      password_confirmation: params[:password_confirmation], 
      api_key: generate_new_api_key
    }
  end

  def generate_new_api_key
    SecureRandom.hex
  end
end