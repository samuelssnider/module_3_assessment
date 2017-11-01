require 'rails_helper'

describe "as a user when i visit the homepage" do
  it "I can fill in the search box with a zip code and get 10 results" do
    # As a user
    # When I visit "/"
    visit '/'
    # And I fill in a search box with "80202" and click "search"
    fill_in "q", with: '80202'
    click_on "Locate"
    # Then my current path should be "/search" (ignoring params)
    expect(current_path).to eq('/search')
    # And I should see stores within 25 miles of 80202
    # And I should see a message that says "17 Total Stores"
    expect(page).to have_css('.total-stores')
    # And I should see exactly 10 results (There are 17 stores within 25 miles. We want to display 10 on this page and 7 on the next. Get the first page to work first from start to finish and worry about pagination later.)
    expect(page).to have_css('.long-name', count: 17)
    expect(page).to have_css('.city', count: 17)
    expect(page).to have_css('.distance', count: 17)
    expect(page).to have_css('.phone-number', count: 17)
    expect(page).to have_css('.store-type', count: 17)
    # And I should see the long name, city, distance, phone number and store type for each of the 10 results
  end
end