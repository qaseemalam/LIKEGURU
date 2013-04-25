require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get menu" do
    get :menu
    assert_response :success
  end

end
