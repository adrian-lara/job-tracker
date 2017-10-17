class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    category = Category.create(category_params)
    if category.id.nil?
      flash[:failure] = "#{category.title} already exists!"
      redirect_to new_category_path
    else
      redirect_to category_path(category)
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

end
