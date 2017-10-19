require 'rails_helper'

describe "When a user visits '/jobs?sort=location'" do
  it "the user sees a list of jobs sorted by location" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Software")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "San Francisco", category: category)
    company.jobs.create!(title: "QA Analyst", level_of_interest: 75, city: "New York City", category: category)

    visit '/jobs?sort=interest'

    expect(first('.sub-details').has_link?("New York City")).to be(true)
  end
end
