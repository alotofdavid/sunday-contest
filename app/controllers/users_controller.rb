class UsersController < ApplicationController
	def index()
		#@all_users = Array.new
		#@all_users = User.all
		#@memberships.sort_by!{ |m| m.group.name.downcase }
		@all_users = User.all.sort { |a,b|
			a.login.downcase <=> b.login.downcase
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
		@needToConfirmEmail = false;
		username = User.find_by_login(params[:text_val])
		if username == nil then
			return
		end
		if username.email_confirmed == false then
			@needToConfirmEmail = true
			@userID = username.id
			return
		end
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
		@newUser.email = params[:email].downcase
		@newUser.password=(params[:passwordBox1][:password1])	
		if(@newUser.save()) then
			options = { :address => "smtp.gmail.com",
           :port                 => 587,
           :domain               => 'sundaycontest.com',
           :user_name            => 'sundaycontestregister',
           :password             => 'stupidlittlebitchiaintfuckinwithyou',
           :authentication       => 'plain',
           :enable_starttls_auto => true  }
			Mail.defaults do
  				delivery_method :smtp, options
			end
			emailString = @newUser.email#have to do this for scoping issues
			saltString = @newUser.salt
			

			mail = Mail.new do
  				from  'sundaycontestregister@gmail.com'
 				to       emailString
  				subject  'Welcome to SundayContest.com!'
  				body     'Thank you for registering at SundayContest.com! Please click on this link to complete your registration. 
  				http://sundaycontest.com/confirm?id=' + saltString 
			end
			mail.deliver!
			



			flash.alert = "A confirmation email has been sent to " + emailString + ". Please note that emails may take up to 10 minutes to send."
			redirect_to "/users/login"
		else
			render:new	
		end
		
	end
	def getPbForEvent(userId,eventName)
		allSubmissions = Submission.where("user_id = ?",  userId.to_s)
		bestTime = nil
		bestTimeString = ""
		allSubmissions.each do |sub|
			if(sub.event.event_name == eventName && (bestTime == nil || sub.result < bestTime) && sub.event.contest != Contest.last) then
				bestTime = sub.result_millis
				bestTimeString = sub.result_string
			end
		end	
		if(bestTime != nil) then
			return bestTimeString# always show 2 decimal places
		end
		return "-"
	end

	def resend()
		@User = User.find(params[:userID])
		options = { :address => "smtp.gmail.com",
           :port                 => 587,
           :domain               => 'sundaycontest.com',
           :user_name            => 'sundaycontestregister',
           :password             => 'stupidlittlebitchiaintfuckinwithyou',
           :authentication       => 'plain',
           :enable_starttls_auto => true  }
		Mail.defaults do
  			delivery_method :smtp, options
		end
		emailString = @User.email#have to do this for scoping issues
		saltString = @User.salt
		mail = Mail.new do
  			from  'sundaycontestregister@gmail.com'
 			to       emailString
  			subject  'Welcome to SundayContest.com!'
  			body     'Thank you for registering at SundayContest.com! Please click on this link to complete your registration. 
  			http://sundaycontest.com/confirm?id=' + saltString
		end
		mail.deliver!
		flash.alert = "A confirmation email has been sent to " + emailString + ". Please note that emails may take up to 10 minutes to send."
		redirect_to "/users/login"
	end
	
	
end
