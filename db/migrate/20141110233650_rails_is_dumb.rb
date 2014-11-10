class RailsIsDumb < ActiveRecord::Migration
  def change
  	add_column :contests, :featured_event_name, :string
  end
end
