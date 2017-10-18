require 'rails_helper'

describe "When a user visits a company show page, enters contact information, and clicks Create Contact" do
  it "the user has created a new contact and is shown the company view page with that new contact" do
    company = Company.create(name: "ESPN")

    visit company_page(company)
    fill_in "contact[full_name]", with: "Alice Bosslady"
    fill_in "contact[position]", with: "Manager of Everything"
    fill_in "contact[email]", with: "alice@email.com"
    click_on "Create Contact"

    expect(current_path).to eq(company_page(company))
    expect(page).to have_content(company.contacts.first.full_name)
    expect(page).to have_content(company.contacts.first.position)
    expect(page).to have_content(company.contacts.first.email)
  end
end
