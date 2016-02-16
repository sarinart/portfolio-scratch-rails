class PagesController < ApplicationController
  def welcome
  end
  def portfolio
  end
  def index
        @posts = Post.all
  end
end
