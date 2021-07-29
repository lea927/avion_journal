require 'rails_helper'

RSpec.describe "EditingCategories", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "edits category and displays index page" do

    # Visiting edit category page
    visit edit_category_path

    # Expecting category to appear on the screen
    category = Category.order("id").last
    expect(category.name).to eq('School')

    # Filling in with new data
    fill_in 'Name', with: 'School - Avion'

    # Clicking on update category button
    click_on 'Update Category'

    # Expecting edited category to appear on screen
    expect(page).to have_content('School - Avion')

     # Confirming category was saved in the database
     category = Category.order("id").last
     expect(category.name).to eq('School - Avion')
  end
end
