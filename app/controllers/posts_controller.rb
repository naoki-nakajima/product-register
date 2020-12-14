class PostsController < ApplicationController
  before_action :set_user

  def index
    @post = Post.new
    @posts = @user.post
  end

  def create
    @post = @user.post.new(post_params)
    if @post.save
      redirect_to users_path(@user), notice: '送信されました'
    else
      @posts = @user.post
      flash.now[:alert] = '入力してください'
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, image).merge(user_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
