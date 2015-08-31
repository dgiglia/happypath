class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash['notice'] = "You're logged in."
      redirect_to root_path
    else
      flash['error'] = "There is something wrong with your username or password."
      redirect_to login_path
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash['notice'] = "You're logged out."
    redirect_to root_path
  end
end