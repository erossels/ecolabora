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
  end

end
