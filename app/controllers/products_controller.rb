class ProductsController < ApplicationController
   before_action :move_to_index
  
   def index
    @products = Product.all.includes(:user)
    @user = current_user
  end

  def new
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
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
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

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def product_params
    params.require(:product).permit(:image, :text)
  end
end