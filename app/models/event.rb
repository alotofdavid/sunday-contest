class Event < ActiveRecord::Base
	belongs_to :contest
	has_many :submissions 
	has_many :scrambles
end
