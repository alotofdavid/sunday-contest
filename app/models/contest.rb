class Contest < ActiveRecord::Base
	has_many :events
	attr_accessor :end_date, :featured_event

	def youHaveCompetedInEvent(event)
		for submission in event.submissions do
			puts("HIHIHIH");
		end
	end
end
