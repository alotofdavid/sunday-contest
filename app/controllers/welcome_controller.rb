
class WelcomeController < ApplicationController
  def index
  	@dueDateString = date_of_next("Saturday");
  	@numUsers = User.all.count
  	@numDollarsAwarded = (Contest.all.count - 1) * 10
    @numSubmissions = 0
    Contest.last.events.each do |event|
      @numSubmissions = @numSubmissions + event.submissions.count
    end
    

  end
  def date_of_next(day)
  	date  = Date.parse(day)
  	delta = date > Date.today ? 0 : 7
  	(date + delta).strftime("%B %d, %Y")
	end
end
