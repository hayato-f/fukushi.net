require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "ログインページて確認" do
    get login_path
    assert_response :success
  end
end
