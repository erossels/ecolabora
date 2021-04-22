class HomeController < ApplicationController
  before_action :authenticate_user!, only: :profile

  def index
    @news = News.all.last(3)
    if user_signed_in?
      redirect_to products_path
    end
  end

  def profile
    @user = current_user
    @products = Product.where(user_id: @user.id)
    @sold_products = Product.where(status: 1, user_id: @user.id)
    @purchases = Purchase.where(user_id: @user.id)
    @evaluations = Evaluation.where(purchase_id: @purchases.product.user.id)
  end

end
