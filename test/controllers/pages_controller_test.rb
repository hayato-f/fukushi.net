require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get "/"
    assert_response :success
    assert_select "title", "福祉.net | top"
  end

  test "should get post" do
    get "/post"
    assert_response :success
    assert_select "title", "福祉.net | post"
  end

  test "should get about" do
    # ↓get-urlの記述はroutesで書かれている記法で
    # get pages_about_url　　＝＞　この記法では書かれていないため、エラーになる。
    get "/about"
    assert_response :success
    assert_select "title", "福祉.net | about"
  end

  test "should get my_page" do
    get "/my_page"
    assert_response :success
    assert_select "title", "福祉.net | my_page"
  end
end
