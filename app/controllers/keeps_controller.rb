class KeepsController < ApplicationController
  def create
    @brewery = Brewery.find(params[:brewery_id])
    current_user.keep(@brewery)
  end

  def destroy
    @brewery = current_user.keeps.find(params[:id]).brewery
    current_user.unkeep(@brewery)
  end
end
