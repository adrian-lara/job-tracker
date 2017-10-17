require 'rails_helper'

describe "When a user visits the create category form, fills in a category, and clicks on Create Category" do
  it "the user has created a new category and is redirected to the category show page" do
    visit new_category_path

    fill_in "category[title]", with: "Web Development"
    click_on "Create Category"

    expect(current_path).to eq(category_path(Category.last))
  end
end
