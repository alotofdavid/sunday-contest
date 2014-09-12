class AddBestToSubmission < ActiveRecord::Migration
  def change
  	    add_column :submissions, :best_time, :integer
  end
end
