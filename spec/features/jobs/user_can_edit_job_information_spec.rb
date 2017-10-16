require 'rails_helper'

describe "When a user visits the job edit page, changes the job information, and clicks 'Update Job'" do
  it "the user has updated the job and sees its show page" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit edit_company_job_path(company,job)
    
    fill_in "job[title]", with: "Intern"
    click_on "Update Job"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("Intern")
  end
end
