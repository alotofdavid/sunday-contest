task :score => :environment do
	contest = Contest.last
	contest.events.each do |event|
		eventName = event.event_name
		eloTimeHash = Hash.new
		event.submissions.each do |sub|
			elo = getEloForEvent(sub.user_id,eventName)	
			eloTimeHash[elo] = sub.result
		end	
		event.submissions.each do |submiss|#probably have to use eval
			#user.something_elo = calculateNewElo(user.elo, time, hashOfEverything)
			newElo = calculateNewElo(getEloForEvent(submiss.user_id,eventName),submiss.result,eloTimeHash)
			setEloForEvent(submiss.user_id,eventName,newElo)
		end	
	end	
	##perform the elo algorithms here
end
