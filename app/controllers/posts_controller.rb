class PostsController < ApplicationController
    def index
        @posts=Post.all.order("created_at DESC")
    end
    def new 
        @post = Post.new
    end
    def create
        @post = Post.create(post_params)
        if @post.save
            flash[:notice] = "Post was successfully created."
            redirect_to post_path(@post)
        else
            render 'new',status: :unprocessable_entity
        end
    end
    def show
        @post=Post.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            flash[:alert]=("The requested post does not exist.")
            redirect_to root_url
    end
    private
    def post_params
        params.require(:post).permit(:title,:content)
    end
end
