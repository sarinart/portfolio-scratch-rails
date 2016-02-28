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
        flash.notice = "Post Created!"
        redirect_to posts_path
    end
    
    def show
        @post = Post.find(params[:id])
        @comment = Comment.new
        @comment.post_id = @post_id
    end
    
    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        flash.notice = "Post Updated!"

        redirect_to posts_path
    end


    def destroy
        Post.find(params[:id]).destroy
        flash.notice = "Post Deleted!"
        
        redirect_to posts_path
        
    end
    
    private
        def post_params
            params.require(:post).permit(:title, :body)
        end
end
