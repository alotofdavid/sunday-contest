class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :scoring_type
      t.timestamps
    end
  end
end
