
class WelcomeController < ApplicationController
  def index
  	@dueDateString = date_of_next("Sunday");

  end
  def date_of_next(day)
  	date  = Date.parse(day)
  	delta = date > Date.today ? 0 : 7
  	(date + delta).strftime("%B %d, %Y")
	end
end
