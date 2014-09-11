class AddCompetedPeopleColumn < ActiveRecord::Migration
  def change
    	add_column :events, :finished_people, :array
  end
end
