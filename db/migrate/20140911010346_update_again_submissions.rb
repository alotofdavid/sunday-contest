class UpdateAgainSubmissions < ActiveRecord::Migration
  def change
    	add_column :submissions, :result, :double
    	add_column :submissions, :time_list, :string
  end
end
