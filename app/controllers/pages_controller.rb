class PagesController < ApplicationController
  def top
    if logged_in?
      @post = current_user.posts.build 
      @feed_items = current_user.feed.paginate( page: params[:page])
    end
  end

  def post
  end

  def about
  end

  def my_page
    # @user = User.find(params[:id])
  end
end
