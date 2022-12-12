class SearchesController < ApplicationController
  def search
    post = Post.left_joins(:category, :my_category)
    
    #何故categories.name（複数形だと値が取れる？　postとhas_oneの関係じゃなかった？）
    @post_items = post.where(
                              'title Like ? or content Like ? or categories.name Like ? or my_categories.name Like ?',
                              "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%"
                            ).paginate(page: params[:page]) 
  
  end
  
end
