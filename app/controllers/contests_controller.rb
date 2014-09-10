class ContestsController < ApplicationController
	def index
		currentCompetition = Competition.last
		
			@endDate = currentCompetition.end_date
			@eventArray = currentCompetition.events.sort_by{|word| word}##
			@featuredEvent = currentCompetition.featured_event
		
	end
end
