
class WelcomeController < ApplicationController
  def index
  	@dueDateString = date_of_next("Saturday");
  	@numUsers = User.all.count
  	@numDollarsAwarded = Contest.all.count * 10
  end
  def date_of_next(day)
  	date  = Date.parse(day)
  	delta = date > Date.today ? 0 : 7
  	(date + delta).strftime("%B %d, %Y")
	end
end
