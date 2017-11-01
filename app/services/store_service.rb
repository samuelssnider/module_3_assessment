class StoreService
  attr_reader :get_stores_count, :get_stores
  def parse_url(zip)
    conn = Faraday.new(url: "https://api.bestbuy.com/") do |faraday| #?format=json&show=phone,storeType,name,city,distance&pageSize=17&apiKey=#{ENV['best_buy_key']}") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    raw_stores = conn.get("v1/stores(area(#{zip},25))", default_params)
    JSON.parse(raw_stores.body, symbolize_names: true)
  end
  
  def default_params
    parameters = {
      show: 'phone,storeType,name,city,distance',
      pageSize: 17,
      apiKey: ENV['best_buy_key'],
      format: 'json'
    }
  end
  
  def get_stores(zip)
    raw_stores = self.parse_url(zip)
    raw_stores[:stores].map do |raw_store|
      Store.new(raw_store[:name],
                raw_store[:city],
                raw_store[:distance],
                raw_store[:phone],
                raw_store[:storeType])
    end
  end
  
  def get_stores_count(zip)
    raw_stores = self.parse_url(zip)
    raw_stores[:total]
  end
end