class PostsController < ApplicationController
  def create
    post = current_user.posts.build params[:post]
    post.transaction do
      post.save
      current_user.experience += post.experience
      current_user.save
    end
    flash[:success] = "Post created!"
    redirect_to root_url
  end
end
