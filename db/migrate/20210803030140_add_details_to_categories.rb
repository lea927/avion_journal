class AddDetailsToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :description, :string
  end
end
