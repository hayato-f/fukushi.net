class FavoritesController < ApplicationController
  before_action :post_params
  def create

    # 投稿したユーザーはいいねできない
    # if current_user.id != @post.user_id
    #   @favorite = Favorite.create(user_id: current_user.id, post_id: @post.id)
      
    # else

    #   redirect_to request.referrer
      
    # end

    # 投稿したユーザーもいいねできる
    @favorite = Favorite.create(user_id: current_user.id, post_id: @post.id)
  end

  def destroy

    # 投稿したユーザーはいいねできない

    # if current_user.id != @post.user_id
    #   @favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
    #   @favorite.destroy

    # else
    #   redirect_to request.referrer
      
    # end


    # 投稿したユーザーもいいねできる
    @favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
    @favorite.destroy
    
  end

  private
  def post_params
    @post = Post.find(params[:post_id])
  end

end
