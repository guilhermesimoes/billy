class CategoriesController < ApplicationController
  before_action :authenticate_user!

  # GET /categories
  def index
    @categories = current_user.categories
  end

  # GET /categories/1
  def show
    @category = current_user.categories.find(params[:id])
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    @category = current_user.categories.find(params[:id])
  end

  # POST /categories
  def create
    @category = current_user.categories.new(category_params)

    if @category.save
      redirect_to categories_url, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /categories/1
  def update
    @category = current_user.categories.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_url, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /categories/1
  def destroy
    @category = current_user.categories.find(params[:id])
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def category_params
    params.require(:category).permit(:user_id, :name)
  end
end
