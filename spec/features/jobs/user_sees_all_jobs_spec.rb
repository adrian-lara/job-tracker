require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Software")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
    company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category: category)

    visit company_path(company)

    expect(page).to have_link("Create New Job")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("QA Analyst")
  end
end

describe "When a user visits '/jobs'" do
  it "the user sees a list of jobs and some of their details" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Software")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
    company.jobs.create!(title: "QA Analyst", level_of_interest: 75, city: "New York City", category: category)

    visit jobs_path
    
    expect(page).to have_link("ESPN")
    expect(page).to have_link("Developer")
    expect(page).to have_link("QA Analyst")
    expect(page).to have_content(70)
    expect(page).to have_content(75)
  end
end
