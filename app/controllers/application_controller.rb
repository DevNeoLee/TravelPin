class ApplicationController < ActionController::Base
    def index
        @posts = Post.search(params[:search])
    end
    
    private

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def post_params
        params.require(:post).permit(:write, :country, :image, :user_id, :name, :post_id, :search)
    end
end
