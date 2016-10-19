require 'rails_helper'

RSpec.feature "guest user visits application root" do
  scenario "and can see a search box" do
    visit root_path

    expect(current_path).to eq(root_path)
    expect(page).to have_content("AltFuelFinder")
    expect(page).to have_button("Locate")
  end
end



# ```
# As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search" with parameters visible in the url
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
# ```
