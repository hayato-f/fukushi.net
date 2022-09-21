class PostsController < ApplicationController
    def new
        @post =  Post.new
    end

    def create
        @post = Post.new(params_post)
        @post.save
        redirect_to @user
    end

    def show
        
    end


        private
            def params_post
                params.require(:post).permit(:title, :content)
            end
end
