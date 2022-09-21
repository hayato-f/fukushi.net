  # userに関わるコントローラー（モデルとのやり取りを行う？）

  class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]  #before_action => actionが実行される前に、実行される。
                                                          #only => edit,update,destroyアクションの時のみに有効。
                                                          #edit,update,~~~,destroyアクションを実行する前に、logged_in_userが必要

  before_action :correct_user, only: [:edit, :update] 
  before_action :admin_user, only: :destroy  # => セキュリティを強くするため

  def index
    @users = User.paginate(page: params[:page]) # User.paginateは、dbの全データから、1page分（デフォルトで３０データ）ずつ取り出して、表示する。
  end
  
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
      # redirect_to @user # redirect_to user_url(@user)と同じ意味　＝＞　userによって、ページ内容が変化（動的）
                        # redirect_to user_path（静的なページ）でもよさそうだが、登録した個人のページ（動的な動作）にアクセスしたいため、これだと、エラーになる。
      redirect_back_or user
      else
      flash[:faild] = "ユーザー作成に失敗しました"
      render 'new'
    end
  end

  def show 
    @user = User.find(params[:id])
    # @posts = @user.posts.pagenate(page: params[:page])
    # debugger
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
      flash[:success] = "編集内容を更新しました"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:sucsess] = "削除しました"
    redirect_to users_path
  end
end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location    # sessions_helperにて定義
        flash[:denger] = "操作を実行には、ログインが必要です"
        redirect_to login_url  # ~~~_urlは絶対パスで指定。  cf)~~~_path => 相対パス.
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)   #sessions_helperにて定義
    end

    def admin_user
      redirect_to root_url unless current_user.admin?
    end


