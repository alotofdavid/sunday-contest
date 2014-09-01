require 'test_helper'

class RouteTest < ActionController::TestCase
	
	test "should route to competition splash" do
		assert_routing '/1', {controller: "competitions", action: "show", id: "1"}
	end

	test "should route to competition specific event" do 
		assert_routing '/1/3', {controller: "events", action: "show", id: "3", parent_id: "1"}
	end

	test "should route to user profile" do
		assert_routing 'users/2', {controller: "users", action: "show", id: "2"}
	end

	
	
end
