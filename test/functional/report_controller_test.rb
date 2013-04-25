require 'test_helper'

class ReportControllerTest < ActionController::TestCase
  test "should get analys" do
    get :analys
    assert_response :success
  end

end
