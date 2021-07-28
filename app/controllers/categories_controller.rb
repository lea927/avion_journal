class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create 
    @category = Category.create!(category_params)
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
