class ItemsController < ApplicationController
    def index
        @items = Item.all
    end

    def show
        @item = Item.friendly.find(params[:id])
    end

    def add_to_cart
        @item = Item.friendly.find(params[:id])
        if current_user
            @cart = current_user.carts
            @cart_items = current_user.carts.last.cart_items

            @cart_items.create!(item: @item)
            redirect_to root_path(success: true)
        else
            redirect_to root_path(alert: true)
        end
    end
end
