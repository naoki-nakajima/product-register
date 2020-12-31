class ProductsController < ApplicationController
   #before_action :move_to_index
  
   def index
    @products = Product.order("RANDOM()").includes(:user).limit(3)
    @user = current_user
  end

  def new
    @user = current_user
    if user_signed_in?
      @product = Product.new
    else
      redirect_to new_user_registration, info: "ログインしてください"
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path, notice: "投稿しました"
    else
      flash.now[:alert] = "未入力です"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    if @product.destroy
      redirect_to root_path, notice: "削除しました"
    else
      f last.now[:danger] = "削除できませんでした"
      redirect_to root_path
    end
  end

  private

  #def move_to_index
  #  redirect_to root_path unless user_signed_in?
  #end


  def product_params
    params.require(:product).permit(:image, :text, :tag).merge(user_id: current_user.id)
  end
end