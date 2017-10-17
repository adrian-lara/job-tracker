require 'rails_helper'

describe "When a user visits the categories index page, clicks edit, changes information, and clicks update" do
  it "the user has updated the category and is taken to that category's show page" do
    category_1 = Category.create(title: "Web Development")

    visit categories_path
    click_on "Edit"
    fill_in "category[title]", with: "Front-End"
    click_on "Update Category"

    expect(Category.last.title).to eq("Front-End")
    expect(current_path).to eq(category_path(Category.last))
    expect(page).to have_content(Category.last.title)
  end
end
