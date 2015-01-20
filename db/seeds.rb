# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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
  	b = Scramble.new
  	b.event_id = bar.id
  	b.scramble_string = "3cramble 2"
  	b.save()
  	c = Scramble.new
  	c.event_id = bar.id
  	c.scramble_string = "3cramble 3"
  	c.save()
  	d = Scramble.new
  	d.event_id = bar.id
  	d.scramble_string = "3cramble 4"
  	d.save()
  	e = Scramble.new
  	e.event_id = bar.id
  	e.scramble_string = "3cramble 5"
  	e.save()
  	f = Scramble.new
  	f.event_id = baz.id
  	f.scramble_string = "4cramble 1"
  	f.save()
  	g = Scramble.new
  	g.event_id = baz.id
  	g.scramble_string = "4cramble 2"
  	g.save()
  	h = Scramble.new
  	h.event_id = baz.id
  	h.scramble_string = "4cramble 3"
  	h.save()
  	i = Scramble.new
  	i.event_id = baz.id
  	i.scramble_string = "4cramble 4"
  	i.save()
  	j = Scramble.new
  	j.event_id = baz.id
  	j.scramble_string = "4cramble 5"
  	j.save()
  	k = Scramble.new
  	k.event_id = buz.id
  	k.scramble_string = "5Scramble 1"
  	k.save()
  	l = Scramble.new
  	l.event_id = buz.id
  	l.scramble_string = "5Scramble 2"
  	l.save()
  	m = Scramble.new
  	m.event_id = buz.id
  	m.scramble_string = "5Scramble 3"
  	m.save()
  	n = Scramble.new
  	n.event_id = buz.id
  	n.scramble_string = "5Scramble 4"
  	n.save()
  	o = Scramble.new
  	o.event_id = buz.id
  	o.scramble_string = "5Scramble 5"
  	o.save()

#    admin1 = User.find_by_login("westonmizumoto");
    #admin2 = User.find_by_login("davidadams");
#    admin1.isAdmin = true;
#    admin1.isMod = true;
#    admin1.save()
    #admin1.save()
    #admin2.isAdmin = true;
    #admin2.isMod = true;
#

a = Announcement.new
a.first_line = "qwertyuiop"
a.second_line = "asdfghjkl"
a.third_line = "zxcvbnm"
a.winner_id = 1
a.random_id = 2

user_list = [
    [ "David", "Adams", '2009ADAM01', 'alotofdavid', 'password'],
    [ "Weston", "Mizumoto", '2008MIZU01', 'westicles', 'password'],
    [ "Mats", "Valk", '2007VALK01', 'mvcuber', 'password'],
    [ "Feliks", "Zemdegs", '2009ZEMD01', 'fazrulz', 'password'],
    [ "Kevin", "Hays", "2009HAYS01", "purplehaze", 'password']
]

#user_list.each do |first_name, last_name, wca_id, login, pw|
    #User.create( first_name: first_name, last_name: last_name, wca_id: wca_id, login: login, password: pw, password1: pw, password2: pw)
#end





