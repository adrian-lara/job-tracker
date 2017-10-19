require 'rails_helper'

describe "When a user visits category index, clicks on category title link" do
  it "the user gets to category show page and sees associated jobs" do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "Software")
    job_1 = company.jobs.create(title: "Developer", level_of_interest: 90, city: "Denver", category: category)
    job_2 = company.jobs.create(title: "Intern", level_of_interest: 99, city: "Denver", category: category)

    visit categories_path
    click_on "Software"

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content("#{job_1.title} (#{company.name})")
    expect(page).to have_content("#{job_2.title} (#{company.name})")
  end
end
