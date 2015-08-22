class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_boards_path(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_boards_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "You have successfuly deleted account with user name: #{@user.name}"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
