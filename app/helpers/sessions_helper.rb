module SessionsHelper
    # ApplicationHelperで、SessionHelperをincludeしたので、ここで定義したメソッドは、他のコントローラーや、ビューなどで使用できる。
    #cf）クラス・継承

    # 渡されたユーザーでログイン
    def log_in(user) # sessionsControllerでuser変数は定義している。同じ名前なので、そのまま使用できる。
        session[:user_id] = user.id  #ここでのsessionはブラウザを落とすと、情報が消える、一時的なsession。
                                    #Cookieが暗号化して保持している、ユーザーの情報を、sessionに（一時Cookieとして）入れて、
                                    # そのユーザー情報を、そのまま保持する事ができる。
    end

    # 現在ログイン中のユーザーを返す。（いる場合。）
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])       # @curent_userが空なら、User.find_by(id: session[:user_id])を代入。
                                                                        #中身が入っていたら、何もせず、処理終了。
            # @current_user = @current_user || User.find_by(id: session[:user_id])と同義
        end

    end

    def current_user?(user)   #渡されたuserがcurrent_userならtrueを返す。
        user && user == current_user
    end

    # ユーザーがログインしていれば、true、いなければ、falseを返す。
    def logged_in?
        !current_user.nil?
    end

    #現在のユーザーをログアウト
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

    def store_location                                          # アクセスしようとした、URLを記憶する。
        session[:forwarding_url] = request.original_url if request.get?
    end

    def redirect_back_or(default)                            #記憶したURLか、デフォルト値にredirect
        redirect_to (session[:forwarding_url] || default)
        session.delete(:forwarding_url)
    end



end
