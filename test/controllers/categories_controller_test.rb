require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get categories_path
    assert_response :success
  end

  test 'should show category' do
    @category = categories(:one)
    get category_url(@category)
    assert_response :success
  end

  test 'should create category' do
    post categories_path, params: { "category": { "name": 'Personal' } }
    assert_response :redirect
  end

  test 'should show edit category' do
    @category = categories(:one)
    @categories = Category.all
    get edit_category_url(@category)
    assert_response :success
  end

  test 'should edit' do
    @category = categories(:one)
    patch category_url(@category), params: { category: { name: @category.name } }
    assert_redirected_to category_url(@category)
  end

  test 'should destroy' do
    @category = categories(:one)
    delete category_url(@category)
    assert_redirected_to categories_url
  end

  test 'should fail create category' do
    post categories_path, params: { "category": { "name": '' } }
    assert_response :unprocessable_entity
  end

  test 'should fail edit category' do
    @category = categories(:one)
    patch category_url(@category), params: { category: { name: '' } }
    assert_response :unprocessable_entity
  end
end
