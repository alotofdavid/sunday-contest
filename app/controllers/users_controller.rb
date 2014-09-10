class UsersController < ApplicationController
	def index()
		@all_users = User.all
	end	
	def show()
		@user = User.find(params[:id])
	end
	def login()
	end

	def logout()
		reset_session
		redirect_to "/users/login"
	end

	def post_login()
		username = User.find_by_login(params[:text_val])
		if username != nil && username.password_valid?(params[:passwordBox][:password]) then
			session[:currentUserID] = username.id
			redirect_to "/users/#{username.id}"		
		end	
	end
	def new()
		@newUser = User.new

	end
	def create
		@newUser = User.new
		password1 = params[:passwordBox1][:password1]
		password2 = params[:passwordBox2][:password2]
		@newUser.savePasswords(password1,password2)
		@newUser.first_name = params[:firstName]
		@newUser.last_name = params[:lastName]
		@newUser.login = params[:login]
		@newUser.password=(params[:passwordBox1][:password1])
		if(@newUser.save()) then		
			redirect_to "/users/login"
		else
			render:new	
		end
	end
	
end
