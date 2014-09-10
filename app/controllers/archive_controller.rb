class ArchiveController < ApplicationController
	def index
		@all_users = User.all
	end
end
