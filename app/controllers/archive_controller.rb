class ArchiveController < ApplicationController
	def index
		@allContests = Contest.all.sort { |a,b|
			b.created_at <=> a.created_at
		}
		if session[:currentUserID] != nil then
			@user = User.find(session[:currentUserID])
		end
	end
	def show
		@thisContest = Contest.find(params[:id])
		@allEvents = Contest.find(params[:id]).events
		if session[:currentUserID] != nil then
			@user = User.find(session[:currentUserID])
		end
	end
	def new
		#There is no good reason for this to be in "new"
		if session[:currentUserID] != nil then
			@user = User.find(session[:currentUserID])
			if @user.isMod == true then
				Submission.destroy(params[:id])
				lastContestID = Contest.last.id
				redirect_to "/archive/" + lastContestID.to_s
			end
		end
	end
end
