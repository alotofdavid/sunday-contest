# Load the Rails application.
require File.expand_path('../application', __FILE__)
def getScramble(scrambleType)
	return "This is a #{scrambleType} scramble!!!"
end	



# Initialize the Rails application.
Rails.application.initialize!
