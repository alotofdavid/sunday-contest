class CompetitionsController < ApplicationController
	def index()
		@all_comps = Competition.all;
	end	
	def show()
		@comp = Competition.find(params[:id])
	end
end
