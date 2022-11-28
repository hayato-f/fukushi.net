class ApplicationController < ActionController::Base
    include SessionsHelper

    private
        def logged_in_user
            unless logged_in?
                store_location    # sessions_helperにて定義
                flash[:denger] = "操作を実行には、ログインが必要です"
                redirect_to login_url  # ~~~_urlは絶対パスで指定。  cf)~~~_path => 相対パス.
            end
        end

end
