class CompetitionsController < ApplicationController
	def index()
		@all_comps = Competition.all;
	end	
	def show()
		@comp = Competition.find(params[:id])
	end

	def youHaveCompetedInEvent(event)
		for submission in event.submissions do
			puts("HIHIHIH");
		end
	end
end
