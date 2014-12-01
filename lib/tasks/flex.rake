task :flex => :environment do
	User.all.each do |user|
		if user.ELO_3x3 < 200 then
			user.ELO_3x3 = 200
			user.save()
		end
		if user.ELO_3x3OH < 200 then
			user.ELO_3x3OH = 200
			user.save()
		end
	end
end