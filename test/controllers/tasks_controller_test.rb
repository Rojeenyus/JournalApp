require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:user1)
    sign_in users(:user1)
    @category = categories(:one)
  end

  test 'should create task' do
    post categories_path(@category), params: { category: { name: @category.name } }
    @task = tasks(:one)
    post category_tasks_path(@category, @task), params: { task: { name: @task.name, description: @task.description } }
    assert_response :redirect
  end

  test 'should destroy task' do
    @task = tasks(:one)
    delete category_task_path(@task.category_id, @task.id)
    assert_redirected_to category_tasks_path(@task.category_id)
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

  test 'should destroy all' do
    @task = tasks(:one)
    get remove_all_category_tasks_path(@task.category_id)
    assert_redirected_to category_path(@task.category_id)
  end

end
