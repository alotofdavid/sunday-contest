class UpdateSubmission < ActiveRecord::Migration
  def change
    	add_column :submissions, :event_id, :integer
    
  end
end
