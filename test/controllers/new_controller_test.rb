require 'test_helper'

class NewControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get new_update_url
    assert_response :success
  end

end
