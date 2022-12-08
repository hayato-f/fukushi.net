class PostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user, only: :destroy


    def index
        # @posts = Post.all
        @feed_items = current_user.feed.paginate( page: params[:page]) # feed => user.rbにメソッドとして定義
        # byebug
    end

    def show
        @favorite = []
        @post = Post.find(params[:id])
        @favorite << Favorite.find_by(post_id: @post.id)
        # byebug
    end
    def new                   #=> 今回は、直接ユーザーページに、入力フォームを作るので、要らない。
                                # cf) newはgetメソッドに対応づけられる。
        @post =  Post.new
    end

    def create
        # TODO: buildメソッドが使えなくなっている。（user_idが付与されない！！）　＝＞　改修する！！
        # @post = current_user.posts.build(params_post) # => カレントユーザーのポストのbuild。　cf) buildメソッド（主キーから、外部キーのデータを作成するときに使える。）
                                                    # Postsモデルは、Usersモデルの外部キー。
                                                    # （主キーのUsersモデル（今はログイン中のユーザー）から、そのユーザーに紐付けられたレコード（Postsモデルの）を呼び出し、Postsモデルにデータを作成する。）


        @post = Post.new(params_post)
        @post.user_id = current_user.id
        @post.image.attach(params[:post][:image])
        if @post.save
            flash[:sucsess] = "投稿しました！！"
            redirect_to root_url
            
        else
            @post_items = current_user.feed.paginate(page: params[:page])
            render 'pages/top'
        end
        # byebug
    end

    def destroy
        @post.destroy
        flash[:success] = "削除しました！"
        redirect_to request.referrer || root_url
        
    end


        private
            def params_post
                params.require(:post).permit(:title, :content, :image)
            end

            def correct_user
                @post = current_user.posts.find_by(id: params[:id])
                redirect_to root_url if @post.nil?
            end
end
