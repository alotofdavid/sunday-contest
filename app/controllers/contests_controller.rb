class ContestsController < ApplicationController
	def index
		@currentCompetition = Competition.last
		
			@endDate = @currentCompetition.end_date
			@eventArray = @currentCompetition.events.sort_by{|word| word}##
			@featuredEvent = @currentCompetition.featured_event
	end
	def show
		@eventName = Event.find(params[:id]).event_name
		@event = Event.find(params[:id])
		if Event.find(params[:id]).finished_people == nil then
			Event.find(params[:id]).finished_people = [session[:currentUserID]];
		else
			Event.find(params[:id]).finished_people << session[:currentUserID]
		end
		@scrambleArray = Array.new
		for scramble in Event.find(params[:id]).scrambles do
			@scrambleArray << scramble.scramble_string
		end
	end
	def post_submit
		puts ("IT WORKED")
		puts params[:dataArray];
		puts params[:currentUserID]; 
		newSubmission = Submission.new
		newSubmission.user_id = params[:currentUserID]
		newSubmission.competition_id = Competition.last.id
		newSubmission.event_id = params[:eventId]
		newSubmission.time_list = params[:dataArray].to_s
		newSubmission.result = params[:result];
		newSubmission.save()
		redirect_to "/contests"		
	end
end
