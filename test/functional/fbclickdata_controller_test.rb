require 'test_helper'

class FbclickdataControllerTest < ActionController::TestCase
  setup do
    @fbclickdatum = fbclickdata(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fbclickdata)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fbclickdatum" do
    assert_difference('Fbclickdatum.count') do
      post :create, fbclickdatum: @fbclickdatum.attributes
    end

    assert_redirected_to fbclickdatum_path(assigns(:fbclickdatum))
  end

  test "should show fbclickdatum" do
    get :show, id: @fbclickdatum.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fbclickdatum.to_param
    assert_response :success
  end

  test "should update fbclickdatum" do
    put :update, id: @fbclickdatum.to_param, fbclickdatum: @fbclickdatum.attributes
    assert_redirected_to fbclickdatum_path(assigns(:fbclickdatum))
  end

  test "should destroy fbclickdatum" do
    assert_difference('Fbclickdatum.count', -1) do
      delete :destroy, id: @fbclickdatum.to_param
    end

    assert_redirected_to fbclickdata_path
  end
end
