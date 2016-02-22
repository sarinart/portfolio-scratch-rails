class PostsController < ApplicationController
    def index
        @posts = Post.all.order('created_at DESC')
    end
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        
        @post.save
        
        redirect_to posts_path
    end
    
    def show
    end
    
    def destroy
        Post.find(params[:id]).destroy
        redirect_to posts_path
    end
    
    private
        def post_params
            params.require(:post).permit(:title, :body)
        end
end
