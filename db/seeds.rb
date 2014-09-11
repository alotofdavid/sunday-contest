# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

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


contest_list = [
  [DateTime.now + 7, '3x3']
]

contest_list.each do |end_date, featured_event|
  Contest.create(end_date: end_date, featured_event: featured_event)
end

c = Contest.last

event_list = [
  ['3x3', 1, c.id],
  ['2x2', 1, c.id],
  ['4x4', 1, c.id],
  ['Pyraminx', 1, c.id]
]

event_list.each do |event_name, scoring_type, c_id|
  Event.create(event_name: event_name, scoring_type: scoring_type, contest_id: c_id)
end



