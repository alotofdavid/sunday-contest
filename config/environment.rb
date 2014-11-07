# Load the Rails application.

require File.expand_path('../application', __FILE__)
require 'rubygems'
require 'scrambler'
def getScramble(scrambleType)
	if(scrambleType == "2x2") then
		return Scrambler::TwoByTwo.new.scramble + " I'm sorry about these scrambles. "
	end
	if(scrambleType == "3x3" || scrambleType == "3x3 OH") then
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
def calculateNewElo(elo, time, eloTimeHash) 
	newElo = elo
	if elo < 2100 then
		kFactor = 32
	end
	if elo >= 2100 && elo < 2400 then
		kFactor = 24
	end
	if elo >= 2400 then
		kFactor = 16
	end	
	#### We can come up with some algorithm to adjust these kFactors
	#### Bigger kfactor means bigger change with each competition
	####
	#puts("original elo is " + elo.to_s)	
	eloTimeHash.each do |oppElo,oppTime|
		#multiplied everything by 100 becuase of floating point bullshits
		expectedScore = 100/(1 + 10**((oppElo-elo)/400))
		score = 0
		if(time < oppTime) then
			score = 100
		end
		if(time == oppTime)then
			score = 50
		end
		diff = kFactor*(score-expectedScore)
		newElo +=  (kFactor*(score-expectedScore))/100
		
		#rputs("diff is " + diff.to_s)	
	end	
	#puts("NEW ELO IS " + newElo.round(0).to_s)
	return newElo.round(0)
end

def getEloForEvent(userId,eventName)
	if(eventName == "3x3 OH") then
		appendThis = "ELO_3x3OH"
	elsif(eventName == "Square-1") then
		appendThis = "ELO_Square1"
	else
		appendThis = "ELO_" + eventName
	end
	elo = ""
	evalString = "elo = (User.find(" + userId.to_s + "))." + appendThis
	eval(evalString)
	return elo

end

def setEloForEvent(userId,eventName,newElo)
	if(eventName == "3x3 OH") then
		appendThis = "ELO_3x3OH"
	elsif(eventName == "Square-1") then
		appendThis = "ELO_Square1"
	else
		appendThis = "ELO_" + eventName
	end
	user = User.find(userId)
	evalString = "user." + appendThis + " = " + newElo.to_s
	eval(evalString)
	user.save()
end

# Initialize the Rails application.
Rails.application.initialize!


















