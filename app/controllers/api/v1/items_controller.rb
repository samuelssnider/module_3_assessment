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
      
      def create
        @item = Item.create(item_params)
        render json: @item, status: 201
      end
      
      private
      
        def item_params
          params.permit(:name, :description, :image_url)
        end
    end
  end
end