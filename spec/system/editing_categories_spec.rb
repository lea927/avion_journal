require 'rails_helper'

RSpec.describe "EditingCategories", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "edits category and displays index page" do
    # destroys existing category to prevent ambigious error
    Category.destroy_all
    # Adds category 
    school = Category.create!(name: "School")

    # Visiting index to display all categories
    visit categories_path

    # Checks if on the index path
    expect(page).to have_current_path categories_path

    # Expecting category to appear on the screen
    expect(page).to have_content('School')
    expect(page).to have_content('Show')

    # Clicks Show link
    click_link 'Show'

    # Checks if on the show path
    expect(page).to have_current_path category_path(id: school.id)

    # Expecting category to appear on the screen under show path
    expect(page).to have_content('School')
    expect(page).to have_content('Edit')

    # Clicks Edit link
    click_link 'Edit'

    # Checks if on the edit path
    expect(page).to have_current_path edit_category_path(id: school.id)

    # Expecting category to appear on the screen under edit path
    expect(page).to have_content('Name')
    
    # Filling in with new data
    fill_in 'Name', with: 'School - Avion'

    # Clicking on update category button
    click_on 'Update Category'

    # Checks if on the show path
    expect(page).to have_current_path category_path(id: school.id)

    # Expecting edited category to appear on screen
    expect(page).to have_content('School - Avion')

     # Confirming category was saved in the database
     category = Category.order("id").last
     expect(category.name).to eq('School - Avion')
  end
end
