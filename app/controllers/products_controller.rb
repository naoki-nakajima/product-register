class ProductsController < ApplicationController
   #before_action :move_to_index
  
   def index
    @products = Product.order("RANDOM()").includes(:user).limit(3)
  end

  def new
    @user = current_user
    if user_signed_in?
      @product = Product.new
    else
      redirect_to new_user_registration_path, info: "ログインしてください"
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
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      redirect_to product_path, notice: "更新が完了しました"
    else
      flash.now[:alert] = "未入力です"
      render :edit
    end
  end

  def show
    @product = Product.find(params[:id])
    @tags = @product.tag_counts_on(:tags)
  end

  def destroy
    product = Product.find(params[:id])
    if product.destroy
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
    params.require(:product).permit(:image, :text, :tag_list).merge(user_id: current_user.id)
  end
end