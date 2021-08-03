require 'rails_helper'

RSpec.describe "EditingTasks", type: :system do
    before do
      driven_by(:rack_test)
    end
  
    it "edits tasks and displays show page" do
      # destroys existing task to prevent ambigious error
      Task.destroy_all

      # Adds category 
      school = Task.create!(name: "School")
  
      # Visiting index to display all categories
      visit categories_path
  
      # Checks if on the index path
      expect(page).to have_current_path categories_path
  
      # Expecting category to appear on the screen
      expect(page).to have_content('School')
      expect(page).to have_content('Show')
