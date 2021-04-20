class HomeController < ApplicationController
  def index
    @news = News.all.last(3)
    
    if user_signed_in?
      redirect_to products_path
    end
  end
end
