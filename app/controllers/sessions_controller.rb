class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success]   = "You are now logged in. Have fun #{user.name.capitalize}!"
      redirect_to boards_path
    else
      flash.now[:danger] = 'There was something wrong with your username or password.'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil

    flash[:danger] = 'You are logged out.'
    redirect_to root_path
  end
end
