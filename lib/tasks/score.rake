task :score => :environment do
	eloBlock = Struct.new(:elo, :result)
	contest = Contest.last
	totalSubmissionNum = 0
	contest.events.each do |e|
		totalSubmissionNum += e.submissions.length
	end
	randomWinnerNumber = rand(0..totalSubmissionNum-1)
	counter = 0
	
	randomWinnerId = 0
	featuredEventWinnerId = 0
	result = nil
	
	contest.events.each do |event|
		eventName = event.event_name
		eloTimeArray = Array.new
		event.submissions.each do |sub|
			elo = getEloForEvent(sub.user_id,eventName)	
			entry = eloBlock.new(elo,sub.result)
			eloTimeArray << entry
		end	
		event.submissions.each do |submiss|#probably have to use eval
			newElo = calculateNewElo(getEloForEvent(submiss.user_id,eventName),submiss.result,eloTimeArray)
			setEloForEvent(submiss.user_id,eventName,newElo)
			if(counter == randomWinnerNumber) then
				randomWinnerId = submiss.user_id
			end	
			counter += 1
		end	
		if(contest.featured_event_name == event.event_name) then
			sortedSubmissions = event.submissions.sort { |a,b|
				a.result <=> b.result
			}
			featuredEventWinnerId = sortedSubmissions[0].user_id
			
		end
	end	
	if(totalSubmissionNum > 1) then
		announcement = Announcement.new
		winner = User.find(featuredEventWinnerId)
		randomWinner = User.find(randomWinnerId)
		announcement.first_line = "Congratulations to " + winner.login + ", the winner of this week's featured event!"
		announcement.winner_id = featuredEventWinnerId
		announcement.second_line = "And congratulations to " + randomWinner.login + " for winning the randomly selected prize."
		announcement.third_line = "You will both be recieving a $5.00 gift card code to SpeedCubeShop.com by email shortly."
		announcement.random_id = randomWinnerId
		announcement.save()

		##email the winners here
	end
	
end
