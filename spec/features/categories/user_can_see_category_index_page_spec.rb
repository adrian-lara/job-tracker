require 'rails_helper'

describe "When a user visits the category index page" do
  it "the user sees a list of categories along with edit and delete links for each category" do
    category_1 = Category.create(title: "Web Development")
    category_2 = Category.create(title: "Back-End")

    visit categories_path

    expect(page).to have_content(category_1.title)
    expect(page).to have_content(category_2.title)
    expect(page).to have_link("Edit", href: edit_category_path(category_1))
    expect(page).to have_link("Edit", href: edit_category_path(category_2))
    expect(page).to have_link("Delete", href: category_path(category_1))
    expect(page).to have_link("Delete", href: category_path(category_2))
  end
end
