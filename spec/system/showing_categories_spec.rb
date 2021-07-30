require 'rails_helper'

RSpec.describe "ShowingCategories", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "displays category" do
    category = Category.last

    visit "/categories/#{category.id}"

    # Checks if on the show path
    expect(page).to have_current_path category_path(id: category.id)

    # Expecting category to appear on the screen under show path
    expect(page).to have_content('School')
    expect(page).to have_content('Edit')
  end
end
