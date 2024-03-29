class CommentsController < ApplicationController
    def create
        @post=Post.find(params[:post_id])
        @comment=@post.comments.create(params[:comment].permit(:name,:body))
        @comment.save
        redirect_to post_path(@post)
    end
    def destroy
        @post=Post.find(params[:post_id])
        @comment=@post.comments.find(params[:id])
        @comment.destroy
        flash[:notice]="Comment Delete Successfully."
        redirect_to post_path(@post)
    end
end
