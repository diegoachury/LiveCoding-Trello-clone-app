class CardsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
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
end
