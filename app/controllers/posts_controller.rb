class PostsController < ApplicationController
  def create
    @post = current_user.posts.build params[:post]
    if @post.save
      flash[:success] = "Post created!"
      redirect_to current_user
    else
      flash[:error] = "You are not logged in!"
    end
  end
end
