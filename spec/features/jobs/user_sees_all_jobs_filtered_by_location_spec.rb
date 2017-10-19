require 'rails_helper'

describe "When a user visits '/jobs?location=Denver'" do
  it "the user sees a list of jobs filtered by location" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Software")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
    company.jobs.create!(title: "QA Analyst", level_of_interest: 75, city: "New York City", category: category)

    visit '/jobs?location=Denver'

    expect(page).to have_link("Developer")
    expect(page).not_to have_link("QA Analyst")
  end
end
