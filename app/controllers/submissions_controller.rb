class SubmissionsController < ApplicationController
	def index()
		@all_subs = Submission.all
	end
	
	def show()
		@sub = Submission.find(params[:id])
	end
end
