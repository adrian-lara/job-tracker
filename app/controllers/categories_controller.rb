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

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    category.update(category_params)

    redirect_to category_path(category)
  end

  def index
    @categories = Category.all
  end

  def destroy
    Category.find(params[:id]).destroy
    
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

end
