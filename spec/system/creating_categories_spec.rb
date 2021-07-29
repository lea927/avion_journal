require 'rails_helper'

# RSpec.describe "CreatingCategories", type: :system do
#   before do
#     driven_by(:rack_test)
#     # driven_by(:selenium_chrome_headless)

#   end

RSpec.describe "CreatingCategories", driver: :selenium_chrome, js: true do

  it "saves and displays the resulting category" do
    # Visiting new category page
    visit '/categories/new'
    sleep(3)

    # Entering name into form field
    fill_in 'Name', with: 'School'
    sleep(3)

    # Clicking on add category button 
    click_on 'Create Category'
    sleep(3)

    # Expecting category to appear on the screen
    expect(page).to have_content('School')
    sleep(3)

    # Confirming category was saved in the database
    category = Category.order("id").last
    expect(category.name).to eq('School')
    sleep(3)

  end
end
