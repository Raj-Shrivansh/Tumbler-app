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
    def edit
        @post=Post.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            flash[:error]="No Post Associate with given id"
            redirect_to root_path
    end
    def update
        @post=Post.find(params[:id])
        if @post.update(post_params)
            flash[:notice]="Post Upated Successfully"
            redirect_to  post_path(@post)
        else
            flash[:error]="Error Occured"
            render :edit, status: :unprocessable_entity
        end
    end
    def destroy
        @post=Post.find(params[:id])
        @post.destroy
        rescue ActiveRecord::RecordNotFound
            flash[:error]="With  Given ID there is no such Post Found!"
            redirect_to  posts_path
    end
    private
    def post_params
        params.require(:post).permit(:title,:content)
    end
end
