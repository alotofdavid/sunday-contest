class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
    	t.datetime :end_date
    	t.string :featured_event
      t.timestamps
    end
  end
end
