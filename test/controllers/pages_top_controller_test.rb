require "test_helper"

class PagesTopControllerTest < ActionDispatch::IntegrationTest
  test "should get post" do
    get pages_top_post_url
    assert_response :success
  end

  test "should get my_page" do
    get pages_top_my_page_url
    assert_response :success
  end

  test "should get about" do
    get pages_top_about_url
    assert_response :success
  end
end
