class FixAddingBest < ActiveRecord::Migration
  def change
  	remove_column :submissions, :best_time
  	add_column :submissions, :best_time, :string

  end
end
