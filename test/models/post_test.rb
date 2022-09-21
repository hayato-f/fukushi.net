require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:hogefuga)    # users.ymlで作成したテストユーザー
    @post = @user.posts.build( content: "てってってっテストだよ〜ん")
  end

  test "postの存在検証" do
    assert @post.valid?
  end

  test "存在しているユーザーIDのみ投稿可能" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "contentの存在性テスト(空文字はだめ？)" do
    @post.content = "   "
    assert_not @post.valid?
  end

  test "contentのの長さが、255以内" do
    @post.content = "a" * 256
    assert_not @post.valid?
  end

  # test "fixtureのデータ最新データと、dbの最初のデータが一緒かのテスト" do
  #   assert_equal posts(:most_recent), Post.first
  # end
end
