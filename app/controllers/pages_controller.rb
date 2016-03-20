class PagesController < ApplicationController
  def welcome
  end
  
  def portfolio
  end
  
  def index
        @posts = Post.all
  end
  
  def about
  end
  
  def contact
  end
  
end
