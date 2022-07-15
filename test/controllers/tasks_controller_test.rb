require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should create task" do
    @category = Category.create(name: "ronee")
    @category.save
    @category = Category.find_by(name: "ronee")
    @task = @category.tasks.create(name: "doing", description: "hi im ronee")
    assert_equal @category.tasks.length, 1
  end

  # test "should delete task" do
  #   post categories_path, params: {"category": { "name": "Personal"}}
  #   @category = Category.find(params[:category_id])
  #   post category_tasks_path, params: {"task": { "name": "Personal", "description": "Personal ito hoy"}}
  #   @category = Category.find(params[:category_id])
  #   @task = @category.tasks.find(params[:id])
  #   @task.destroy
  #   assert_equal @category.tasks.length, 0
  # end

end
