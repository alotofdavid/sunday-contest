class WelcomeController < ApplicationController
  def index

  	foo = Contest.new
  	foo.end_date = Time.now
  	foo.featured_event = "3x3"
  	foo.save()
  	bar = Event.new
  	bar.contest_id = foo.id 
  	bar.event_name = "3x3";
  	bar.save
  	baz = Event.new
  	baz.event_name = "4x4";
  	baz.contest_id = foo.id
  	baz.save()
  	buz = Event.new
  	buz.event_name = "5x5"
  	buz.contest_id = foo.id
  	buz.save()

  	a = Scramble.new
  	a.event_id = bar.id
  	a.scramble_string = "3cramble 1"
  	a.save()
  	a = Scramble.new
  	a.event_id = bar.id
  	a.scramble_string = "3cramble 2"
  	a.save()
  	a = Scramble.new
  	a.event_id = bar.id
  	a.scramble_string = "3cramble 3"
  	a.save()
  	a = Scramble.new
  	a.event_id = bar.id
  	a.scramble_string = "3cramble 4"
  	a.save()
  	a = Scramble.new
  	a.event_id = bar.id
  	a.scramble_string = "3cramble 5"
  	a.save()
  	a = Scramble.new
  	a.event_id = baz.id
  	a.scramble_string = "4cramble 1"
  	a.save()
  	a = Scramble.new
  	a.event_id = baz.id
  	a.scramble_string = "4cramble 2"
  	a.save()
  	a = Scramble.new
  	a.event_id = baz.id
  	a.scramble_string = "4cramble 3"
  	a.save()
  	a = Scramble.new
  	a.event_id = baz.id
  	a.scramble_string = "4cramble 4"
  	a.save()
  	a = Scramble.new
  	a.event_id = baz.id
  	a.scramble_string = "4cramble 5"
  	a.save()
  	a = Scramble.new
  	a.event_id = buz.id
  	a.scramble_string = "5Scramble 1"
  	a.save()
  	a = Scramble.new
  	a.event_id = buz.id
  	a.scramble_string = "5Scramble 2"
  	a.save()
  	a = Scramble.new
  	a.event_id = buz.id
  	a.scramble_string = "5Scramble 3"
  	a.save()
  	a = Scramble.new
  	a.event_id = buz.id
  	a.scramble_string = "5Scramble 4"
  	a.save()
  	a = Scramble.new
  	a.event_id = buz.id
  	a.scramble_string = "5Scramble 5"
  	a.save()
  end
end
