class AccountController < ApplicationController
	def index
		@user = User.find(session[:currentUserID])
	end
end
