require 'test_helper'

class ProdCategoriesControllerTest < ActionController::TestCase
  setup do
    @prod_category = prod_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prod_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prod_category" do
    assert_difference('ProdCategory.count') do
      post :create, prod_category: { name: @prod_category.name, order_no: @prod_category.order_no }
    end

    assert_redirected_to prod_category_path(assigns(:prod_category))
  end

  test "should show prod_category" do
    get :show, id: @prod_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prod_category
    assert_response :success
  end

  test "should update prod_category" do
    patch :update, id: @prod_category, prod_category: { name: @prod_category.name, order_no: @prod_category.order_no }
    assert_redirected_to prod_category_path(assigns(:prod_category))
  end

  test "should destroy prod_category" do
    assert_difference('ProdCategory.count', -1) do
      delete :destroy, id: @prod_category
    end

    assert_redirected_to prod_categories_path
  end
end
