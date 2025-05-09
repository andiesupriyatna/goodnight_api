class SessionsController < ApplicationController
    def create
      user = User.find_by(username: params[:username])
      if user&.authenticate(params[:password])
        user.generate_token
        render json: { token: user.token }, status: :ok
      else
        render json: { error: 'Invalid username or password' }, status: :unauthorized
      end
    end
  end
  