class Contest < ActiveRecord::Base
	def youHaveCompetedInEvent(event)
		for submission in event.submissions do
			puts("HIHIHIH");
		end
	end
end
