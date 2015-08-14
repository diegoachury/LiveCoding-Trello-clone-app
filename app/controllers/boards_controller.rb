class BoardsController < ApplicationController
  before_action :get_user_and_board, only: [:show, :edit, :update, :destroy]
  def index
    @boards = Board.all.limit 5
  end

  def show

  end

  def new
    @user  = current_user
    @board = Board.new
  end

  def create
    @user  = current_user
    @board = @user.boards.build(board_params)

    if @board.save
      flash[:success] = "Board has been successfully created!"
      redirect_to user_boards_path(current_user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @board.update(board_params)

    if @board.save
      flash[:success] = 'The Board wass successfully updated.'
      redirect_to user_boards_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @board.destroy
    flash[:success] = "Board: #{@board.name} was deleted."
    redirect_to user_boards_path(@user)
  end

  private

  def board_params
    params.require(:board).permit(:name, :description)
  end

  private

  def get_user_and_board
    @user  = User.find(params[:user_id])
    @board = Board.find(params[:id])
  end
end
