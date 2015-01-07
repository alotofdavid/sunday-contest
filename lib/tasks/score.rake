require 'mail'
task :score => :environment do
	eloBlock = Struct.new(:elo, :result)
	contest = Contest.last
	totalSubmissionNum = 0
	contest.events.each do |e|
		# e.submissions.each do |s|
		# 	if s.result == "DNF" then
		# 		s.destroy
		# 	else
		# 		totalSubmissionNum = totalSubmissionNum + 1
		#	end
		#end
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
			if elo == 0 then
				elo = 1200
			end
			entry = eloBlock.new(elo,sub.result_millis)
			eloTimeArray << entry
		end	
		event.submissions.each do |submiss|
			newElo = calculateNewElo(getEloForEvent(submiss.user_id,eventName),submiss.result_millis,eloTimeArray)
			setEloForEvent(submiss.user_id,eventName,newElo)
			if(counter == randomWinnerNumber) then
				randomWinnerId = submiss.user_id
			end	
			counter += 1
		end	
		if(contest.featured_event_name == event.event_name) then
			sortedSubmissions = event.submissions.sort { |a,b|
				a.result_millis <=> b.result_millis
			}
			if(sortedSubmissions[0] != nil) then
				featuredEventWinnerId = sortedSubmissions[0].user_id
			else
				featuredEventWinnerId = nil
			end
			
		end
	end	
	if(featuredEventWinnerId == randomWinnerId) then## if we randomly chose the same person twice, then try again
		featuredEvent = Event.find_by_event_name(contest.featured_event_name)
		size = featuredEvent.submissions.length
		if(size > 1) then
			sortedSub = featuredEvent.submissions.sort { |a,b|
				a.result_millis <=> b.result_millis
			}
			secondChoiceSubmission = sortedSub[size - 1]
			randomWinnerId = secondChoiceSubmission.user_id
		end
	end


	if(totalSubmissionNum > 1) then
		announcement = Announcement.new
		if featuredEventWinnerId != nil then
			winner = User.find(featuredEventWinnerId)
			randomWinner = User.find(randomWinnerId)
			announcement.first_line = "Congratulations to " + winner.login + ", the winner of this week's featured event!"
			announcement.winner_id = featuredEventWinnerId
			announcement.second_line = "And congratulations to " + randomWinner.login + " for winning the randomly selected prize."
			announcement.third_line = "You will both be recieving a $5.00 gift card code to SpeedCubeShop.com by email shortly."
			announcement.random_id = randomWinnerId
			announcement.save()
		else
			announcement.first_line = "Unfortunately, since nobody competed in the featured event, there will be no prize offered."
			randomWinner = User.find(randomWinnerId)
			announcement.second_line = "But congratulations to " + randomWinner.login + " for winning the randomly selected prize."
			announcement.third_line = "You will be recieving a $5.00 gift card code to SpeedCubeShop.com by email shortly."
			announcement.random_id = randomWinnerId
			announcement.save()
		end

		##email the winners here
		options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'sundaycontest.com',
            :user_name            => 'sundaycontest.com',
            :password             => 'stupidlittlebitchiaintfuckinwithyou',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }
		Mail.defaults do
  			delivery_method :smtp, options
		end
		if randomWinner != nil then
			mail = Mail.new do
  				from  'sundaycontest.com@gmail.com'
 				to       randomWinner.email
  				subject  'Congratulations from SundayContest.com!'
  				body     'Congratulations on winning a $5.00 gift card code from SpeedCubeShop.com. You should be recieving an email from them containing the code shortly.
  				
  				Thanks for participating in SundayContest.com!'
			end
			mail.deliver!
		end
		if User.find(featuredEventWinnerId) != nil then
			mail = Mail.new do
  				from  'sundaycontest.com@gmail.com'
 				to       winner.email
  				subject  'Congratulations from SundayContest.com!'
  				body     'Congratulations on winning this week\'s featured event and a $5.00 gift card code from SpeedCubeShop.com. You should be recieving an email from them containing the code shortly.
  				
  				Thanks for participating in SundayContest.com!'
			end
			mail.deliver!
		end
		if randomWinnerId != nil then
			mail = Mail.new do
  				from  'sundaycontest.com@gmail.com'
 				to       'service@speedcubeshop.com'
  				subject  'This week\'s SundayContest.com winners'
  				body     'The winners for this week are ' + winner.email + ' and ' + randomWinner.email + '. Thanks Cameron. <3'

			end
			mail.deliver!
		end

	end
	
end
