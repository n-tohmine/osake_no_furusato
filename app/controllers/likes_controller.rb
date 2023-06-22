class LikesController < ApplicationController
  def create
    @brewery = Brewery.find(params[:brewery_id])
    current_user.like(@brewery)
  end

  def destroy
    @brewery = current_user.likes.find(params[:id]).brewery
    current_user.unlike(@brewery)
  end
end
