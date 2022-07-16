require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'should create task' do
    @category = categories(:one)
    post categories_path(@category), params: { category: { name: @category.name } }
    @task = tasks(:one)
    post category_tasks_path(@category, @task), params: { task: { name: @task.name, description: @task.description } }
    assert_response :redirect
  end

  test 'should destroy task' do
    @task = tasks(:one)
    delete category_task_path(@task.category_id, @task.id)
    assert_redirected_to category_path(@task.category_id)
  end

  test 'should show new task' do
    @task = tasks(:one)
    get new_category_task_path(@task.category_id, @task.id)
    assert_response :success
  end

  test 'should show edit task' do
    @task = tasks(:one)
    get edit_category_task_path(@task.category_id, @task.id)
    assert_response :success
  end

  test 'should update task' do
    @task = tasks(:one)
    patch category_task_path(@task.category_id, @task.id), params: { task: { name: 'hey', description: 'hey' } }
    assert_response :redirect
  end

end
