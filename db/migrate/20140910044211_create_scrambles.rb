class CreateScrambles < ActiveRecord::Migration
  def change
    create_table :scrambles do |t|
    	t.string :scramble_string
      t.timestamps
    end
  end
end
