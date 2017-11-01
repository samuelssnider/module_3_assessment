class SearchController < ApplicationController
  
  def index
    zip = params["q"]
    # @conn = Faraday.new(url: "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=phone,storeType,name,city,distance&pageSize=17&apiKey=#{ENV['best_buy_key']}")
    service = StoreService.new #JSON.parse(@conn.get.body, symbolize_names: true)
    @count = service.get_stores_count(zip)
    @stores = service.get_stores(zip)
  end
end