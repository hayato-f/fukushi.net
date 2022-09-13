  # userに関わるコントローラー（モデルとのやり取りを行う？）

  class UsersController < ApplicationController

  def new  #userの新規登録ページ
    @user = User.new
  end

  def create
    # debugger
    @user = User.new(user_params)   #これだと、例えば、admin='1'と記載すると、管理者権限を持っているユーザーを作る事ができる。
    # debugger
    if @user.save
      log_in @user    #サインアップしたら、そのままログイン。 => log_inメソッドは、session_helperで定義。
      flash[:success] = "#{@user.name}さん、Welcome" # flash変数は、ハッシュの中身を持つ。　 => flash{ success: "@userさん、Welcome""}
      redirect_to @user # redirect_to user_url(@user)と同じ意味　＝＞　userによって、ページ内容が変化（動的）
                        # redirect_to user_path（静的なページ）でもよさそうだが、登録した個人のページ（動的な動作）にアクセスしたいため、これだと、エラーになる。
    else
      flash[:faild] = "ユーザー作成に失敗しました"
      render 'new'
    end
  end

  def show 
    @user = User.find(params[:id])
    # debugger
  end
end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end


