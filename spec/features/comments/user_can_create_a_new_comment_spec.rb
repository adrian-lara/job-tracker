require 'rails_helper'

describe "When a user visits a job show page, enters content in comment field, clicks Create Comment" do
  it "the user has created a new comment and is shown the same job show page with that new comment" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Software")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)

    visit company_path(company)
    click_link "Developer"
    fill_in "comment[content]", with: "I'm leaving a comment here as a test."
    click_on "Create Comment"
    fill_in "comment[content]", with: "This is the second comment."
    click_on "Create Comment"

    save_and_open_page
    expect(job.comments.count).to eq(2)
    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("I'm leaving a comment here as a test.")
    expect(page).to have_content("Posted")
  end
end
