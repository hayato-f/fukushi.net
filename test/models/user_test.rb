require "test_helper"

class UserTest < ActiveSupport::TestCase
  # ↓テスト用のユーザーの作成
  def setup
    @user = User.new( name: "hoge", email: "hoge@email.com",
                      password: "hogehoge", password_confirmation: "hogehoge")
  end

  test "should be valid" do
    assert @user.valid?   #valid?メソッドは、models/user.rbで設定。
                          #テストユーザーが有効か確認(models/user.rbで設定するまでは、オブジェクトがあればtrueを返す？)
  end

  test "name should be present" do   #nameの存在に関するテスト
    # 一番最初に、テストコードを書いて、テスト。わざ失敗させ、テストコードの有効性を確認。
    # その次に、models/user.rbで実装したいコードを書いてもう一度テスト。テストが成功したら、テストもコードの実装もOK
    @user.name = "    "   #空を代入（システム上、エラーにしたい情報）　＝＞　models/user.rbでfalseになるように設定。
    assert_not @user.valid?   #@userがfalseならtrueでテストを通す（　空の名前はNG）
  end

  test "email should be present" do
    @user.email = "   "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid? # => 文字が５１文字以上は入らないようにしたい。　
                              # （テストで通らない事を確認して、models/user.rbで設定。これで、値がfalseになり、テストがtrueになる。）
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  # メールのフォーマット機能未実装

  test "email addreses should be unique" do #emailの一意性のテスト
    user_dup = @user.dup    #dupでemailを複製し、変数に入れる。（dupは複製するためのアカウント）
    # binding.irb
    user_dup.email = @user.email.upcase     # => メールアドレスは、大文字・小文字を区別しない。
    # binding.irb
    @user.save                    #@userをセーブする。（実はset upで定義していたユーザーはまだ、データベースに反映されていなかったから。）
                                  #これで、データベース上に、＠user。そして、これからデータベースに登録したい、user_email_dup（＠userの複製）の準備ができた。
    assert_not user_dup.valid?  # データベース上に、同じemaiなければOK！！あれば、だめ！！
  end

  test "should be present(nonblank)" do
    @user.password = @user.password_confirmation = " " * 6    #多重代入 => passwordにもconfirmationにも代入したい
    assert_not @user.valid?
  end

  test "should be hava a minimum length" do
    @user.password = @user.password_confirmation =  "a" * 5
    assert_not @user.valid?
  end

end
