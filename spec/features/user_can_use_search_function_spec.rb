require 'rails_helper'

describe "As a user when I visit the root" do
  xscenario "and I fill in the search form" do
    VCR.use_cassette("services/search_function") do

      visit "/"

      page.fill_in "search" with: ("80203")

      expect(path).to equal('http://localhost:3000/search?utf8=%E2%9C%93&q=80203&commit=Locate')
      expect(page).to have_content("U-Haul")
      expect(page).to have_content("PUBLIC STATIONS")
      expect(page).to have_content("City of Denver - Firehouse Parking Lot")
      expect(page).to have_content("VERVE DENVER")
      expect(page).to have_content("City of Denver - Acme Parking Lot")
      expect(page).to have_content("City of Denver - Denver Performing Arts Center Garage")
      expect(page).to have_content("City of Denver - Colorado Convention Center Garage")
    end
  end
end
# As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search" with parameters visible in the url
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
