class ListsController < ApplicationController
  before_action :find_board_and_user, only: [:new, :create]

  def new
    @list = List.new
  end

  def create
    @list = @board.lists.build(list_params)

    if @list.save
      flash[:success] = "List: #{@list.name} saved!"
      redirect_to user_board_path(@user, @board)
    else
      render 'new'
    end
  end

  private

  def find_board_and_user
    @board = Board.find(params[:board_id])
    @user  = @board.user
  end

  def list_params
    params.require(:list).permit(:name, :position)
  end
end
