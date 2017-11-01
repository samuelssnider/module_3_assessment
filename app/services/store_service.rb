class StoreService
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
end