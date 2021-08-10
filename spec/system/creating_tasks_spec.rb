require 'rails_helper'

RSpec.describe 'CreatingTasks', type: :system do
  let!{:category } {Category.new}

  describe 'Creates new task' do
    it 'redirects to new task page' do
      category.save(name: "This is the category name", description: "This is the category description") 
      visit categories_path
      expect(page).to have_current_path categories_path
      expect(page).to have_content('This is the category name')
      expect(page).to have_content('Show')
      click_on 'Show'
    end
    it 'displays category details' do
      expect(page).to have_current_path new_category_task_path
      expect(page).to have_content('This is the category name')
      expect(page).to have_content('This is the category description')
    end
    it 'successfully creates a new task' do
        within 'form' do
          fill_in 'name', with: 'This is the task name'
          fill_in 'descripton', with: 'This is the task description'
          click_on 'Create Task'
        end
    end
    it 'displays resulting task' do
      within 'body' do
        expect(page).to have_content('This is the task name')
        expect(page).to have_content('This is the task description')
      end
    end
    it 'confirms task was saved to database' do
      task = Task.order("id").last
      expect(task.name).to eq('This is the task name')
      expect(task.description).to eq('This is the task description')
    end
  end
end
