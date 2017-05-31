class SessionController < ApplicationController
	def login
	end

	def create
		@user = User.find_by(email: params[:email])
		if @user
			  if @user.authenticate(params[:password])
			  	sign_in @user
		      redirect_to root_path
		      flash[:notice] = "Login successfully."
        else
        	redirect_to login_session_index_path, notice: "You have entered wrong password. Please try again"
        end	
		else
			redirect_to login_session_index_path, notice: "You have entered wrong email. Please try again!"
		end    
	end	

	def logout
		session[:user_id] = nil
		redirect_to root_path, notice: "Logged out successfully."
	end
end
