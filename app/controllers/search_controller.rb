class SearchController < ApplicationController
  
  def index
    zip = params["q"]
    service = StoreService.new 
    @count = service.get_stores_count(zip)
    @stores = service.get_stores(zip) 
  end
end