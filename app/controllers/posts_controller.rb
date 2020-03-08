class PostsController < ApplicationController

    def new 
        @user = User.find(params[:user_id])
        @post = Post.new
    end

    def create
        @user = User.find(params[:user_id])
        @post = @user.posts.create(post_params)
        if @post.save
            redirect_to user_post_path(@user, @post), notice: "Created your posting"
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
            redirect_to user_post_path(@user, @post), notice: "Created your posting"
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
        redirect_to user_path(@user), notice: "Post Deleted"
    end

    private

    def post_params
        params.require(:post).permit(:write, :country, :image, :user_id)
    end
end
