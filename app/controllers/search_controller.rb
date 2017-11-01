class SearchController < ApplicationController
  
  def index
    # @conn = Faraday.new(url: "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=phone,storeType,name,city,distance&pageSize=17&apiKey=#{ENV['best_buy_key']}")
    raw_stores = StoreService.new.parse_url(params[:q]) #JSON.parse(@conn.get.body, symbolize_names: true)
    @count = raw_stores[:total]
    @stores = raw_stores[:stores].map do |raw_store|
      Store.new(raw_store[:name],
                raw_store[:city],
                raw_store[:distance],
                raw_store[:phone],
                raw_store[:storeType])
    end
  end
end