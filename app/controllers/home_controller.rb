class HomeController < ApplicationController
  before_action :authenticate_user!, only: :profile

  def index
    @news = News.all.last(3)
    if user_signed_in?
      redirect_to products_path
    end
  end

  def profile
    @user = User.find(current_user.id)
    @products = Product.where(user_id: @user.id)
    @products = @products.order(created_at: :desc)
    @purchases = Purchase.where(user_id: @user.id)
    @all_purchases = Purchase.all
    @sales = Purchase.where(product_id: @products.ids)
    @evaluations = Evaluation.where(purchase_id: @purchases.ids)
    @products_group_by_day = Product.where(user_id: @user.id).group(:created_at).count
    @products_group_by_category = Product.where(user_id: @user.id).joins(:category).group("categories.name").count
  end

end