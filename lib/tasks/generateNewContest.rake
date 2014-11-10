
task :generate => :environment do
  allEventArray = ["2x2", "4x4","5x5", "6x6","7x7", "3x3 OH","Square-1", "Megaminx","Pyraminx", "Clock","Skewb"] 
  selectedEvents = ["3x3"] + allEventArray.sample(3)
  newContest = Contest.new
  newContest.featured_event_name = selectedEvents[rand(0..3)]
  newContest.save()
  selectedEvents.each do |eventName|
    numScrambles = 12
    if(eventName == "6x6" || eventName == "7x7") then
        numScrambles = 5
    end 
    newEvent = Event.new
    newEvent.event_name = eventName
    newEvent.contest_id = newContest.id
    newEvent.save()
    for i in 1..numScrambles do
      newScramble = Scramble.new
      newScramble.event_id = newEvent.id
      newScramble.scramble_string = getScramble(eventName);
      newScramble.save()
    end
  end
  
end
