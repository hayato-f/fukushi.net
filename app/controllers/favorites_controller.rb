class FavoritesController < ApplicationController
  before_action :post_params
  def create
    if current_user.id != @post.user_id
      @favorite = Favorite.create(user_id: current_user.id, post_id: @post.id)
      
    else
      redirect_to request.referrer
      
    end
    # redirect_to posts_path
  end

  def destroy
    if current_user.id != @post.user_id
      @favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
      @favorite.destroy

    else
      redirect_to request.referrer
      
    end
    # redirect_to posts_path
    
  end

  private
  def post_params
    @post = Post.find(params[:post_id])
  end

end
