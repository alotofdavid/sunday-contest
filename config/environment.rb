# Load the Rails application.

require File.expand_path('../application', __FILE__)
require 'rubygems'
require 'scrambler'
eloBlock = Struct.new(:elo, :result)

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
def calculateNewElo(elo, time, eloTimeArray) 
	#return 800
	if elo == 0 then
		elo = 800
	end
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
	excludedMyself = false#I use this bool to exclude myself from the array
	eloTimeArray.each do |eloBlock|
		oppElo = eloBlock.elo
		oppTime = eloBlock.result
		#multiplied everything by 100 becuase of floating point bullshits
		if(eloBlock.elo == elo && oppTime = time && !excludedMyself) then##this bugs out when we have results like 0.1, 0.11 0.11, etc
			excludedMyself = true
			next
		end	
		expectedScore = 100/(1 + 10**((oppElo - elo)/400))
		score = 0
		if(time < eloBlock.result) then
			score = 100
		end
		if(time == eloBlock.elo)then
			score = 50
		end
		diff = kFactor*(score-expectedScore)/100
		newElo +=  diff
		
	end	
	#puts("NEW ELO IS " + newElo.round(0).to_s)
	result = newElo.round(0)
	if result < 1 then
		return 1
	end	
	return result
end

def getEloForEvent(userId,eventName)
	if(eventName == "3x3 OH") then
		appendThis = "ELO_3x3OH"
	elsif(eventName == "Square-1") then
		appendThis = "ELO_Square1"
	else
		appendThis = "ELO_" + eventName
	end
	elo = 0
	user = User.find(userId)
	evalString = "elo = user." + appendThis
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



def getClassFromElo(elo)
	if elo < 200 then
		return "Class J"
	end
	if elo < 400 then
		return "Class I"
	end
	if elo < 600 then
		return "Class H"
	end
	if elo < 800 then
		return "Class G"
	end
	if elo < 1000 then
		return "Class F"
	end
	if elo < 1200 then
		return "Class E"
	end
	if elo < 1400 then
		return "Class D"
	end
	if elo < 1600 then
		return "Class C"
	end
	if elo < 1800 then
		return "Class B"
	end
	if elo < 2000 then
		return "Class A"
	end
	if elo < 2200 then
		return "Expert"
	end
	if elo < 2400 then
		return "National Master"
	end
	return "Senior Master"


end
# Initialize the Rails application.
Rails.application.initialize!

















