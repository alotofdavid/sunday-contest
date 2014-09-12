class Contest < ActiveRecord::Base
	has_many :events
	attr_accessor :end_date, :featured_event	
end
