class ItemsController < ApplicationController
  def create(name)
    @item = Item.new(item_params)
    @item.name = name
    @item.user = current_user

    if item.save
      flash[:notice] = "You created a new To-Do item."
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error saving your new To-Do item."
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :user)
  end
end
