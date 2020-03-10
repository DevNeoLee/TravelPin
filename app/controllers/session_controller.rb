class SessionController < ApplicationController
    def new
    end

    def create
        user = User.find_by_email(params[:email])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user), notice: " Logged In! Enjoy Your Stay : ) "
        else
            flash.now.alert = " Email or Passwords are Not Matched! Please Try Again "
            render 'session/new'
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_url, notice: " Have a wonderful day : ) "
    end
end
