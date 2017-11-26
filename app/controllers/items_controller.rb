class ItemsController < ApplicationController
  respond_to :html, :js

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      flash[:notice] = "You created a new To-Do item."
    else
      flash.now[:alert] = "There was an error saving your new To-Do item."
    end
    redirect_to root_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
