require 'rails_helper'

describe "When a user clicks the link to delete a job in job index page" do
  it "the user has deleted that job and now seees the company show/ job index page" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Software")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category: category)
    company.jobs.create!(title: "Intern", level_of_interest: 99, city: "Denver", category: category)

    visit company_jobs_path(company)
    click_link "Delete", href: company_job_path(company, company.jobs.first)

    expect(page).not_to have_link("Developer")
    expect(page).to have_link("Intern")
    expect(company.jobs.count).to eq(1)
  end
end

describe "When a user clicks the link to delete a job in job show page" do
  it "the user has deleted that job and now seees the company show/ job index page" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Software")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category: category)
    company.jobs.create!(title: "Intern", level_of_interest: 99, city: "Denver",  category: category)

    visit company_job_path(company,company.jobs.first)
    click_link "Delete"

    expect(page).not_to have_link("Developer")
    expect(page).to have_link("Intern")
    expect(company.jobs.count).to eq(1)
  end
end
