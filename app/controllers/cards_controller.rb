class CardsController < ApplicationController
  before_action :get_user_board_list, only: [:create, :edit, :update, :destroy]
  before_action :require_user

  before_action :require_same_user
  def create
    @card = @list.cards.build(name:        params[:name], 
                              description: params[:description],
                              position:    params[:position]) 
    
    if @card.save
      respond_to do |format|
        format.js
      end
    else
    end
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    @card.update(params.require(:card).permit(:name, :description, :position, :list_id))

    if @card.save
      redirect_to user_board_path(@user, @board)
    else
      render 'edit'
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    respond_to do |format|
      format.js
    end
  end

  private

  def get_user_board_list
    @user  = User.find(params[:user_id])
    @board = Board.find(params[:board_id])
    @list  = List.find(params[:list_id])
  end
end
