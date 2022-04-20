require "test_helper"

class DebugControllerTest < ActionDispatch::IntegrationTest
  test "should get render_params" do
    get debug_render_params_url
    assert_response :success
  end
end
