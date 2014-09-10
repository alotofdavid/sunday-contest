class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
    	
      t.timestamps
    end
  end
end
