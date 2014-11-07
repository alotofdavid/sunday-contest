require 'resolv'
class AccountController < ApplicationController
	def index
		@user = User.find(session[:currentUserID])
	end
	def post_submit_email
		user = User.find(session[:currentUserID])
		if(params[:email] != nil && validate_email_domain(params[:email])) then
			#check is valid email
			user.email = params[:email]
			user.save()
		end	
		redirect_to "/account"
	end
	def post_submit_WCA
		user = User.find(session[:currentUserID])
		if(params[:wca_id] != nil && isValidWCAID(params[:wca_id])) then
			user.wca_id = params[:wca_id]
			user.save()
		end	
		redirect_to "/account"
	end	

	def isValidWCAID(string)
		if( /\A\d\d\d\d\w\w\w\w\d\d\z/.match(string)!= nil ) then
			return true
		end
			return false
	end	
	def validate_email_domain(email)
      domain = email.match(/\@(.+)/)
      if(domain == nil)then 
      	return false
      end
      domain = domain[1]
      Resolv::DNS.open do |dns|
          @mx = dns.getresources(domain, Resolv::DNS::Resource::IN::MX)
      end
      @mx.size > 0 ? true : false
end
end
