class EventsController < ApplicationController
	def index()
		@all_events = Event.all
	end	
	
	def show()
		@event = Event.find(params[:id])
	end
end
