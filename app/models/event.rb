class Event < ActiveRecord::Base
	has_many :scrambles
	belongs_to :competition
	has_many :submissions
end
