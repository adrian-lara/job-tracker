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

describe "When a user visits the the job show page" do
  it "the user can click on a link to take them to the job's edit page" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_job_path(company, job)
    click_on "Edit"

    expect(current_path).to eq(edit_company_job_path(company,job))
  end
end

describe "When a user visits the job index page" do
  it "the user can click on a link to take them to a job's edit page" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_jobs_path(company)
    click_on "Edit"

    expect(current_path).to eq(edit_company_job_path(company,job))
  end
end
