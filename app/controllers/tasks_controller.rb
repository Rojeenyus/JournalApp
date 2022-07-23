class TasksController < ApplicationController
  before_action :user

  def user
    @user = User.find(current_user.id)
  end
  
  def new
    @category = Category.find(params[:category_id])
    @task = Task.new
  end

  def create
    @category = Category.find(params[:category_id])
    @task = @category.tasks.create(task_params)
    redirect_to category_path(@category)
  end

  def destroy
    @category = Category.find(params[:category_id])
    @task = @category.tasks.find(params[:id])
    @task.destroy
    redirect_to category_tasks_path(@category)
    # respond_to do |format|
    #   format.js {render inline: "location.reload();" }
    # end
  end

  def edit
    @category = Category.find(params[:category_id])
    @task = @category.tasks.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @task = @category.tasks.find(params[:id])
    @task.update(task_params)
    redirect_to category_path(@category)
  end

  def remove_all
    @category = Category.find(params[:category_id])
    Task.delete_all
    redirect_to category_path(@category), status: 303
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :deadline)
  end
end
