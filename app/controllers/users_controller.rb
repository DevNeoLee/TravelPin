class UsersController < ApplicationController
    def index
    end
        
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to user_path(@user), notice: " Thank you for Signing Up! : )/n Now, Please Log In" 
        else
            render 'new'
        end
    end
   
    def show
        @user=User.find(params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:email, :password_digest, :password, :password_confirmation)
    end
end
