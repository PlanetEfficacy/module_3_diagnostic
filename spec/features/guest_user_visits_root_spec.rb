require 'rails_helper'

RSpec.feature "guest user visits application root" do
  scenario "and can see a search box" do
    visit root_path

    expect(current_path).to eq(root_path)
    expect(page).to have_content("AltFuelFinder")
    expect(page).to have_button("Locate")
  end
end
