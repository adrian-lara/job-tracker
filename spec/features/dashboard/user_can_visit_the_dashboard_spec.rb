require 'rails_helper'

describe "When a user visit '/dashboard'" do
  it "the user sees a count of jobs by level of interest" do
    company_1 = Company.create!(name: "ESPN")
    company_2 = Company.create!(name: "Turing")
    company_3 = Company.create!(name: "Ibotta")
    category = Category.create(title: "Software")
    company_1.jobs.create!(title: "Developer", level_of_interest: 70, city: "San Francisco", category: category)
    company_2.jobs.create!(title: "QA Analyst", level_of_interest: 75, city: "New York City", category: category)
    company_2.jobs.create!(title: "Manger of People", level_of_interest: 85, city: "Remote", category: category)
    company_3.jobs.create!(title: "Manger of People", level_of_interest: 75, city: "Remote", category: category)

    visit '/dashboard'

    expect(page).to have_content("Interest Level 70 - 1 job(s)")
    expect(page).to have_content("Interest Level 75 - 2 job(s)")
    expect(page).to have_content("Interest Level 85 - 1 job(s)")
  end
end
