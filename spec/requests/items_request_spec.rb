require 'rails_helper'

describe "when i send a get request to api-v1-items" do
  it "I should recieve a 200 response with items" do
    Item.create(name: "Toy", description: "Yeah", image_url: "hey")
    Item.create(name: "Toy", description: "Yeah", image_url: "hey")
    get 'api/v1/items'
    
    items = JSON.parse(response.body)
    expect(response).to have_http_status(200)
    expect(items.count).to eq(2)
    expect(items.first).to have_key("id")
    expect(items.first).to have_key("name")
    expect(items.first).to have_key("description")
    expect(items.first).to have_key("image_url")
    expect(items.first).to_not have_key("created_at")
    expect(items.first).to_not have_key("updated_at")
  end
end

describe "when i send a get request to api-v1-items-show" do
  it "I should recieve a 200 response with one item" do
    item   = Item.create(name: "Toy", description: "Yeah", image_url: "hey")
    item_2 = Item.create(name: "Toy", description: "Buddy", image_url: "derp")
    get "api/v1/items/#{item_2.id}"
    
    items = JSON.parse(response.body)
    expect(response).to have_http_status(200)
    expect(items.count).to eq(4)
    expect(items).to have_key("id")
    expect(items).to have_key("name")
    expect(items).to have_key("description")
    expect(items).to have_key("image_url")
    expect(items["image_url"]).to eq("derp")
    expect(items).to_not have_key("created_at")
    expect(items).to_not have_key("updated_at")
  end
end

describe "when i send a delete request to api-v1-items-show" do
  it "I should recieve a 204 response with one item" do
    item   = Item.create(name: "Toy", description: "Yeah", image_url: "hey")
    item_2 = Item.create(name: "Toy", description: "Buddy", image_url: "derp")
    delete "api/v1/items/#{item_2.id}"
    
    expect(response).to have_http_status(204)
    expect(Item.count).to eq(1)
    expect(Item.last).to eq(item)
  end
end
# When I send a GET request to /api/v1/items I receive a 200 JSON response containing all items And each item has an id, name, description, and image_url but not the created_at or updated_at
# When I send a GET request to /api/v1/items/1 I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
# When I send a DELETE request to /api/v1/items/1 I receive a 204 JSON response if the record is successfully deleted