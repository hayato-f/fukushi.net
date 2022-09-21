require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    # get "/"
    get root_path
    assert_response :success
    assert_select "title", "福祉.net"
  end

  # test "should get post" do
  #   # get "/post"
  #   get post_path # => postを使用したすべてのurlに適用可能！　routeに "/post" の記述でも通る！！ 
  #   # get pages_post_url => routeにこの記述がないと通らない。
  #   assert_response :success
  #   assert_select "title", "福祉.net | post"
  # end

  test "should get about" do
    # ↓get-urlの記述はroutesで書かれている記法で
    # get pages_about_url　　＝＞　この記法でroutesに書かれていないため、エラーになる？？
    # get "/about"
    get about_path
    assert_response :success
    assert_select "title", "福祉.net | about"
  end

  # test "should get my_page" do
  #   # get "/my_page"
  #   get my_page_path
  #   assert_response :success
  #   assert_select "title", "福祉.net | my_page"
  # end
end
