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

RSpec.feature "user searches by zipcode" do
  scenario "and gets a search page with a list of 10 stations" do
    visit root_path
    fill_in "q", with: "80203"
    click_button "Locate"

    expect(current_path).to eq(search_path)
    expect(page).to have_content("10 closest stations within 6 miles sorted by distance:")
    expect(page).to have_css("tr", count: 11)
    expect(page).to have_content("ELEC")

    within("table") do
      expect(page).to have_content("Name")
      expect(page).to have_content("Address")
      expect(page).to have_content("Fuel Type")
      expect(page).to have_content("Distance")
      expect(page).to have_content("Access Times")
    end
  end
end
