class SeedData < ActiveRecord::Migration
  def change
  	foo = Competition.new
  	foo.end_date = Date.today
  	foo.save()
  	bar = Event.new
  	bar.event_name = "2x2"
  	bar.competition_id = foo.id
  	bar.save()
  	baz = Event.new 
  	baz.competition_id = foo.id
  	baz.event_name = "3x3"
  	baz.save()
  	poo = Event.new
  	poo.competition_id = foo.id
  	poo.event_name = "4x4"
  	poo.save()

  end
end
