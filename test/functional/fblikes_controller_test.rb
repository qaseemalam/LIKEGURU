require 'test_helper'

class FblikesControllerTest < ActionController::TestCase
  setup do
    @fblike = fblikes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fblikes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fblike" do
    assert_difference('Fblike.count') do
      post :create, fblike: @fblike.attributes
    end

    assert_redirected_to fblike_path(assigns(:fblike))
  end

  test "should show fblike" do
    get :show, id: @fblike.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fblike.to_param
    assert_response :success
  end

  test "should update fblike" do
    put :update, id: @fblike.to_param, fblike: @fblike.attributes
    assert_redirected_to fblike_path(assigns(:fblike))
  end

  test "should destroy fblike" do
    assert_difference('Fblike.count', -1) do
      delete :destroy, id: @fblike.to_param
    end

    assert_redirected_to fblikes_path
  end
end
