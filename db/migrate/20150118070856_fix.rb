class Fix < ActiveRecord::Migration
  def change
  	  	add_column :events, :user_id, :int
  end
end
