class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
    	t.datetime :end_date
    	t.string :featured_event
      t.timestamps
    end
  end
end
