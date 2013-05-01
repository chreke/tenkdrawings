class StaticPagesController < ApplicationController
  def home
    @user = current_user
    redirect_to new_session_path unless @user
  end
end
