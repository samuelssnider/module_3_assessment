class Store
  attr_reader :name, :city, :distance, :phone, :type
  def initialize(name, city, distance, phone, type)
    @name = name
    @city = city
    @distance = distance
    @phone = phone
    @type = type
  end
  
end