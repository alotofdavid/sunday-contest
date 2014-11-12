class CreateContestsEvents < ActiveRecord::Migration
  def change
  	create_table :events do |t|
    	t.string :scoring_type
    	t.string :event_name
    	t.integer :contest_id
      t.timestamps
    end
    create_table :contests do |t|
    	t.datetime :end_date
    	t.string :featured_event
      t.string :featured_event_name
      t.timestamps
    end
  end
end
