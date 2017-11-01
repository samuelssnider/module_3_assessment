module Api
  module V1
    class ItemsController < ApplicationController
      def index
        render json: Item.all
      end
      
      def show
        @item = Item.find(params[:id])
        render json: @item
      end
      
      def destroy
        @item = Item.find(params["id"])
        render json: @item.destroy
        head :no_content
      end
    end
  end
end