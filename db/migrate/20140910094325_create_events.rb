class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :scoring_type
    	t.string :event_name
    	t.integer :competition_id
      t.timestamps
    end
  end
end
