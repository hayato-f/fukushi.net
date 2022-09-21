require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
#   def setup
#     @user = user(:fogefuga)     #fixtures
#   end
#   test "loginページの動作確認" do
#     get login_path
#     assert_template 'sessions/new'  #sessions/newのビューが正しく表示できているか。
#     post login_path, params: { session: { email: "", password: "" } }
#     assert_template 'sessions/new'
#     assert_not flash.empty?     #flash変数（　ログイン失敗時には、値が入る）が => false(空じゃなければ、)ならOK。
#                                 #post送信で、失敗の情報が渡され、ログインは失敗するので、flashが表示されないといけない。
#     get root_path         #適当なページに移動。
#     assert flash.empty?   #　ページを移動したので、flashは消えるべき。

#   end
end
