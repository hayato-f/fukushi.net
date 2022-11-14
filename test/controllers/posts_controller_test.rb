require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @post = posts(:hello)
  end

  test "投稿できるのはログインしてから" do
    assert_no_difference "Post.count" do  #以下で、postメソッドを実行する。投稿数が変化していなければ、true。
      post posts_path, params: { post: { content: "hogehoge"}}
    end
    assert_redirected_to login_url      #redirects先が正しいか評価
  end

  test "投稿内容の削除はログインしている方ユーザーが行う" do
    assert_no_difference "Post.count" do    #以下で、deleteメソッドを実行する。投稿数が変化していなければ、true。
      delete post_path(@post)   # => 消すのは一つの投稿だから単数形？
    end
    assert_redirected_to login_url
  end

end
