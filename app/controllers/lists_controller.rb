class ListsController < ApplicationController
  before_action :find_board_and_user, only: [:new, :create]

  def new
    @list = List.new
  end

  def create

  end

  private

  def find_board_and_user
    @board = Board.find(params[:board_id])
    @user = @board.user
  end

end
