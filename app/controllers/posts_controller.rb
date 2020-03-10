class PostsController < ApplicationController

    def index
        @user = User.find(params[:user_id])
        @posts = @user.posts.search(params[:search])
    end

    def new 
        @user = User.find(params[:user_id])
        @post = @user.posts.new
    end

    def create
        @user = User.find(params[:user_id])
        @post = @user.posts.create(post_params)
        if @post.save
            redirect_to user_post_path(@user, @post), notice: " Posting Created "
        else
            render "new"
        end
    end

    def edit
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:id])
    end

    def update
        @user = current_user
        @post = current_user.posts.find(params[:id])
        if @post.update(post_params)
            redirect_to user_post_path(@user, @post), notice: " Posting Updated "
        else
            render "edit"
        end
    end


    def show
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:id])
    end

    def destroy
        @user =  User.find(params[:user_id])
        @post = @user.posts.find(params[:id])
        @post.destroy
        redirect_to user_path(@user), notice: " Posting Deleted "
    end

    private

    def post_params
        params.require(:post).permit(:write, :country, :image, :user_id)
    end
end
