class ConfirmController < ApplicationController
	def index()
		user = User.find_by_salt(params[:id])
		if(user != nil) then
			user.email_confirmed = true
			user.save()
		end

	end
end
