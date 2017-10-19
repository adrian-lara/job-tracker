require 'rails_helper'

describe "When a user visit '/dashboard'" do
  before(:each) do
    company_1 = Company.create!(name: "ESPN")
    company_2 = Company.create!(name: "Turing")
    company_3 = Company.create!(name: "Ibotta")
    company_4 = Company.create!(name: "Chase")
    category = Category.create(title: "Software")
    company_1.jobs.create!(title: "Developer", level_of_interest: 70, city: "San Francisco", category: category)
    company_2.jobs.create!(title: "QA Analyst", level_of_interest: 75, city: "New York City", category: category)
    company_2.jobs.create!(title: "Manger of People", level_of_interest: 85, city: "Remote", category: category)
    company_3.jobs.create!(title: "Manger of People", level_of_interest: 75, city: "Remote", category: category)

    visit '/dashboard'
  end

  it "the user sees a count of jobs by level of interest" do
    expect(page).to have_content("Interest Level 70 - 1 job(s)")
    expect(page).to have_content("Interest Level 75 - 2 job(s)")
    expect(page).to have_content("Interest Level 85 - 1 job(s)")
  end

  it "the user sees the top 3 companies ranked by avg level of interest" do
    expect(page).to have_content("Top 3 Companies (Avg. Interest Level)")
    expect(page).to have_content("Turing (80.0)")
    expect(page).to have_content("Ibotta (75.0)")
    expect(page).to have_content("ESPN (70.0)")
  end

  it "the user sees a list of location links and job counts" do
    expect(page).to have_link("San Francisco")
    expect(page).to have_content("San Francisco - 1 job(s)")
    expect(page).to have_content("Remote - 2 job(s)")
  end
end
