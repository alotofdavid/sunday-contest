class RankingController < ApplicationController
	def index
		@all_users = 
		if (params[:sortby] != nil ) then
			@eventName = params[:sortby]
		else
			@eventName = "3x3"
		end
		appendThis = "ELO_" + @eventName.to_s
		evalThis = "@all_users = User.all.sort { |a,b| 
		b." 
		evalThis += appendThis #+  "<=> b." + appendThis"
		evalThis += "<=> a." 
		evalThis += appendThis
		evalThis += "}"
		eval(evalThis)
		@eloHash = Hash.new
		@all_users.each do |user|
			@eloHash[user.id] = getEloForEvent(user.id,@eventName)
		end
		#metaprogramming makes up for bad decisions early on!
		@niceFormatEventName = @eventName
		if @niceFormatEventName == "3x3OH" then
			@niceFormatEventName = "3x3 OH"
		end
		if @niceFormatEventName == "Square1" then
			@niceFormatEventName = "Square-1"
		end
	end
	def getEloForEvent(userId,eventName)#function defined in environment.rb, but can't call it for some reason :(
	if(eventName == "3x3 OH") then
		appendThis = "ELO_3x3OH"
	elsif(eventName == "Square-1") then
		appendThis = "ELO_Square1"
	else
		appendThis = "ELO_" + eventName
	end
	elo = 0
	user = User.find(userId)
	evalString = "elo = user." + appendThis
	eval(evalString)
	return elo

end
end
