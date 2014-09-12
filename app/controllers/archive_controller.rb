class ArchiveController < ApplicationController
	def index
		@allContests = Contest.all.sort { |a,b|
			b.created_at <=> a.created_at
		}
		
	end
	def show
		@allEvents = Contest.find(params[:id]).events
	end
end
