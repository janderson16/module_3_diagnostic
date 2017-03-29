require 'rails_helper'

describe "As a user when I visit the root" do
  scenario "and I fill in the search form" do

    visit "/"

    fill_in "search" with "80203"

    expect(path).to equal('http://localhost:3000/search?utf8=%E2%9C%93&q=80203&commit=Locate')
    expect(page)
  end
end
As a user
When I visit "/"
And I fill in the search form with 80203
And I click "Locate"
Then I should be on page "/search" with parameters visible in the url
Then I should see a list of the 10 closest stations within 6 miles sorted by distance
And the stations should be limited to Electric and Propane
And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
