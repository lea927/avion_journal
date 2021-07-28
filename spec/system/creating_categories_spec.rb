require 'rails_helper'

RSpec.describe "CreatingCategories", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "saves and displays the resulting category" do
    # Visiting new category page
    visit '/categories/new'

    # Entering name into form field
    fill_in 'Name', with: 'School'

    # Clicking on add category button 
    click_on 'Create Category'

    # Expecting category to appear on the screen
    expect(page).to have_content('School')

    # Confirming category was saved in the database
    category = Category.order("id").last
    expect(category.name).to eq('School')

  end
end
