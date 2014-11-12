class CreateAnnouncements < ActiveRecord::Migration
  def change
  	create_table :announcements do |t|
    	t.string :first_line
    	t.string :second_line
    	t.string :third_line
    	t.integer :winner_id
    	t.integer :random_id
    	t.timestamps
    end
  end
end
