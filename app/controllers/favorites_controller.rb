class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    # byebug
    if current_user.id != @post.user_id
      @favorite = Favorite.create(user_id: current_user.id, post_id: @post.id)
      
    end
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:post_id])
    if current_user.id != @post.user_id
      @favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
      @favorite.destroy
      
    end
    redirect_to posts_path
    
  end

end
