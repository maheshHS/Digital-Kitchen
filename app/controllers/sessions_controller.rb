class SessionsController < ApplicationController

    def def new
        
    end

    def create 
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "Logged In Successfully"
            redirect_to root_path
        else
            flash[:error] = "Login Failed"
            render :new
        end
    end

    def destroy 
        session[:user_id] = nil 
        flash[:success] = "Successfully Logged Out"
        redirect_to root_path
    end
    
end