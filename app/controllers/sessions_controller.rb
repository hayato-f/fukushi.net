class SessionsController < ApplicationController
  def new
  end

  def create
    # binding.irb
    user = User.find_by(email: params[:session][:email].downcase)   #db?モデル?のemailカラムから、params以下（ログインページで入力した値）と同じデータを探して、取り出し、user変数に格納。。
                                                                  #user変数の中身はこうなる。　＝＞　user(name: "~~~", email: "~~~",
                                                                                                # password: "ハッシュ暗号化された値", password_confirmation: "ハッシュ暗号化された値")

    if user && user.authenticate(params[:session][:password])     #db内のメールアドレスとパスワードが両方正しい場合のみ、true。
                                                                  # パスワードの中身は、ハッシュで暗号化されて、そのまま評価できない。authenticateメソッドを使う。
                                                                  #authenticate => has_secure_passwordを追加して使えるようになる。
                                                                  #authenticate(引数)、引数の値が正しければ、そのオブジェクトを返す（今回は、dbのuser変数の中身。）。 間違っていれば、falseを返す。
      log_in user           #sessionsHelperにて定義。
      redirect_to user      # redirect_to user_url(user)と同義
    else
      flash.now[:login_failed] = "ログインに失敗しました。メールアドレスとパスワードが正しくありません"
      render 'new'          #  render => viewのみを表示。対応するコントローラーのアクションは実行されない。
    end

  end

  def destroy
    log_out
    redirect_to root_url     # redirect_to => 対応するコントローラのアクションを実行してから、viewを表示する。 

  end
end
