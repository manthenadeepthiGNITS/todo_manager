class SessionsController < ApplicationController
  def new
  end
  def create
    user =User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render plain:"you have entered correct password"
    else
      render plain:"incorrect password"
    end
  end
end
