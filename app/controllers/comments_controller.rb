class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        @comment.post_id = params[:post_id]
        @comment.save
        
        redirect_to post_path(@comment.post)
    end
    
    def destroy
        @post = Post.find params[:post_id]
        @comment = @post.comments.find params[:id]
        @comment.destroy
        flash.notice = "Comment Deleted!"
        redirect_to post_path(@post)
    end
    
    private
        def comment_params
            params.require(:comment).permit(:author_name, :body)
        end
end
