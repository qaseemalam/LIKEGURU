require 'test_helper'

class FbusersControllerTest < ActionController::TestCase
  setup do
    @fbuser = fbusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fbusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fbuser" do
    assert_difference('Fbuser.count') do
      post :create, fbuser: @fbuser.attributes
    end

    assert_redirected_to fbuser_path(assigns(:fbuser))
  end

  test "should show fbuser" do
    get :show, id: @fbuser.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fbuser.to_param
    assert_response :success
  end

  test "should update fbuser" do
    put :update, id: @fbuser.to_param, fbuser: @fbuser.attributes
    assert_redirected_to fbuser_path(assigns(:fbuser))
  end

  test "should destroy fbuser" do
    assert_difference('Fbuser.count', -1) do
      delete :destroy, id: @fbuser.to_param
    end

    assert_redirected_to fbusers_path
  end
end
