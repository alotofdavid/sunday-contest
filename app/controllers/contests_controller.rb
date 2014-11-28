require 'date'
class ContestsController < ApplicationController
	def index
		@currentCompetition = Contest.last
		@endDate = @currentCompetition.end_date
		@eventArray = @currentCompetition.events.sort_by{|word| word}##
		@featuredEvent = @currentCompetition.featured_event
		@dueDateString = date_of_next("sunday")
	end
	def show
		@eventName = Event.find(params[:id]).event_name
		@event = Event.find(params[:id])
		@scrambleArray = Array.new
		for scramble in Event.find(params[:id]).scrambles do
			@scrambleArray << scramble.scramble_string
			puts scramble.scramble_string
		end
		@numScrambles = @scrambleArray.count
		@thisContest = Contest.last
	end
	def post_submit
		puts params[:dataArray];
		puts params[:currentUserID]; 
		newSubmission = Submission.new
		newSubmission.user_id = params[:currentUserID]
		newSubmission.contest_id = Contest.last.id
		newSubmission.event_id = params[:eventId]
		newSubmission.time_list = params[:dataArray].to_s
		newSubmission.result = params[:result]#This is unused as of 11/28/14, replaced by next two lines
		newSubmission.result_string = params[:result]#string
		newSubmission.result_millis = params[:resultMillis]#int
		newSubmission.best_time = params[:best_time]
		newSubmission.save()
		redirect_to "/"		
	end
	def date_of_next(day)
  	date  = Date.parse(day)
  	delta = date > Date.today ? 0 : 7
  	(date + delta).strftime("%B %d, %Y")
	end
end
