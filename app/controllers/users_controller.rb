class UsersController < ApplicationController
  def show
    @item = current_user.items.new
    @items = current_user.items
  end
end
