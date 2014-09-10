class Submission < ActiveRecord::Base
	belong_to :event
	belong_to :user
end
