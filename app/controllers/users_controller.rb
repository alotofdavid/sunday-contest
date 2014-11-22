class UsersController < ApplicationController
	def index()
		#@all_users = Array.new
		#@all_users = User.all
		#@memberships.sort_by!{ |m| m.group.name.downcase }
		@all_users = User.all.sort { |a,b|
			a.login <=> b.login
		}
	end	
	def show()
		@PBs = Hash.new
		@user = User.find(params[:id])
		allEventArray = ["2x2","3x3","4x4","5x5", "6x6","7x7", "3x3 OH","Square-1", "Megaminx","Pyraminx", "Clock","Skewb"]
		allEventArray.each do |event|
			@PBs[event] = getPbForEvent(@user.id,event)
		end
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
		@newUser.wca_id = params[:wca_id]
		@newUser.email = params[:email]
		@newUser.password=(params[:passwordBox1][:password1])
		if(@newUser.save()) then		
			redirect_to "/users/login"
		else
			render:new	
		end
		




	end
	def getPbForEvent(userId,eventName)
		allSubmissions = Submission.where("user_id = ?",  userId.to_s)
		bestTime = nil
		allSubmissions.each do |sub|
			if(sub.event.event_name == eventName && (bestTime == nil || sub.result < bestTime)) then
				bestTime = sub.result
			end
		end	
		if(bestTime != nil) then
			return bestTime.to_s
		end
		return "-"
	end
	
	
end
