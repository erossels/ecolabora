class HomeController < ApplicationController
  def index
    @news = News.all.last(3)
  end
end
