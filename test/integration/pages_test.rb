require "test_helper"

class PagesTest < ActionDispatch::IntegrationTest
  test "pages links" do   #ページリンクが適切に遷移できるかのテスト
    get root_path   #テストするページに移動
    assert_template 'pages/top'   #移動先のページが正しく描画されているかのチェック
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", my_page_path   # リンク先に飛べるかテスト
                                              # ?の部分には、my_page_pathが代入される
    assert_select "a[href=?]", post_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", signup_path
  end
end
