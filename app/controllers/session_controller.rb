class SessionController < ApplicationController
    def new

    end

    def create
        user = User.find_by_email(params[:email])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user), notice: "Welcome Back! Now, you are logged in!"
        else
            flash.now.alert = "email or passwords are not correct! Pls try again."
            render 'session/new'
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_url, notice: "Good bye, logged out"
    end
end
