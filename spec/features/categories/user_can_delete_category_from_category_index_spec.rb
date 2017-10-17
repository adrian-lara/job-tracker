require 'rails_helper'

describe "When a user visits the category index page and clicks delete for a category in the list" do
  it "the user has deleted this category and now sees the index without that deleted category" do
    category_1 = Category.create(title: "Web Development")
    category_2 = Category.create(title: "Back-End")

    visit categories_path

    click_link "Delete", href: category_path(category_1)

    expect(current_path).to eq(categories_path)
    expect(page).not_to have_content(category_1.title)
  end
end
