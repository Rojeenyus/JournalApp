class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :user

  def user
    @user = User.find(current_user.id)
    @tasks = @user.tasks.where("deadline = ?", Date.today.midnight)
  end

  def index
    # render json: {success: true}, status:
    @categories = Category.all
  end

  def show
    @category = Category.find(params['id'])
    unless @category.user_id == current_user.id
      redirect_to categories_path
    end
  end

  def create
    @categories = Category.all
    @category = @user.categories.new(category_params)

    if @category.save
      redirect_to @category
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @categories = Category.all
    @category = Category.new
  end

  def edit
    @categories = Category.all
    @category = Category.find(params[:id])
  end

  def update
    @categories = Category.all
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to @category
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path, status: :see_other
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
