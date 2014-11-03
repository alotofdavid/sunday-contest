# Load the Rails application.

require File.expand_path('../application', __FILE__)
require 'rubygems'
require 'scrambler'
def getScramble(scrambleType)
	if(scrambleType == "2x2") then
		return Scrambler::TwoByTwo.new.scramble + " I'm sorry about these scrambles. "
	end
	if(scrambleType == "3x3" || scrambleType == "OH") then
		return Scrambler::ThreeByThree.new.scramble
	end
	if(scrambleType == "4x4") then
		return Scrambler::FourByFour.new.scramble
	end
	if(scrambleType == "5x5") then
		return Scrambler::FiveByFive.new.scramble
	end
	if(scrambleType == "6x6") then
		return Scrambler::SixBySix.new.scramble
	end
	if(scrambleType == "7x7") then
		return Scrambler::SevenBySeven.new.scramble
	end
	if(scrambleType == "Pyraminx") then
		return Scrambler::Pyraminx.new.scramble
	end
	if(scrambleType == "Clock") then
		return Scrambler::Clock.new.scramble
	end
	if(scrambleType == "Megaminx") then
		return Scrambler::Megaminx.new.scramble
	end
	if(scrambleType == "Square-1") then
		return Scrambler::Square1.new.scramble
	end
	if(scrambleType == "Skewb") then
		return "We have not implemeneted Skewb scrambles yet. Skewb is a dumb event."
	end
	return "There has been an error generating scrambles."
end	



# Initialize the Rails application.
Rails.application.initialize!
