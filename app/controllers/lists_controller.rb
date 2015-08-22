class ListsController < ApplicationController
  before_action :find_board_and_user, only: [:new, :create] 
  before_action :find_board_user_list, only: [:edit, :update, :destroy]
  before_action :require_user
  before_action :require_same_user

  def new
    @list = List.new
  end

  def create
    @list = @board.lists.build(list_params)

    if @list.save
      redirect_to user_board_path(@user, @board)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @list.update(list_params)

    if @list.save
      redirect_to user_board_path(@user, @board)
    else
      render 'edit'
    end
  end

  def destroy
    @list.destroy
    redirect_to :back
  end

  private

  def find_board_and_user
    @board = Board.find(params[:board_id])
    @user  = @board.user
  end

  def find_board_user_list
    @user  = User.find(params[:user_id])
    @board = Board.find(params[:board_id])
    @list  = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :position)
  end
end
