class CardsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @card = @list.cards.build(name: params[:name], 
                              description: params[:description]) 

    if @card.save
      board = Board.find(params[:board_id])

      redirect_to user_board_path(current_user, board)
    end
  end
end
