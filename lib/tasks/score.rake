task :score => :environment do
	eloBlock = Struct.new(:elo, :result)

	contest = Contest.last
	contest.events.each do |event|
		eventName = event.event_name
		eloTimeArray = Array.new
		event.submissions.each do |sub|
			elo = getEloForEvent(sub.user_id,eventName)	
			entry = eloBlock.new(elo,sub.result)
			eloTimeArray << entry
			if(eventName == "Skewb") then
				puts(eloTimeArray)
			end
		end	
		event.submissions.each do |submiss|#probably have to use eval
			#user.something_elo = calculateNewElo(user.elo, time, hashOfEverything)
			newElo = calculateNewElo(getEloForEvent(submiss.user_id,eventName),submiss.result,eloTimeArray)
			setEloForEvent(submiss.user_id,eventName,newElo)
		end	
	end	
	##perform the elo algorithms here
end
