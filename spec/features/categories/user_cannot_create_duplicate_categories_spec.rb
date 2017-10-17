require 'rails_helper'

describe "When a user tries to create a category that already exists" do
  it "the user is brought back to the category new form page" do
    category_1 = Category.create(title: "Web Development")

    visit new_category_path
    fill_in "category[title]", with: "Web Development"
    click_on "Create Category"

    expect(Category.count).to eq(1)
    expect(current_path).to eq(new_category_path)
  end
end
