class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success]   = 'You have been successfuly logged in'
      redirect_to boards_path
    else
      flash.now[:danger] = 'There was something wrong with username or password'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end
end
