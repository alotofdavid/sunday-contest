class FixElos < ActiveRecord::Migration
  def change
  	remove_column :users, :ELO_2x2
  	remove_column :users, :ELO_3x3
  	remove_column :users, :ELO_4x4
  	remove_column :users, :ELO_5x5
  	remove_column :users, :ELO_6x6
  	remove_column :users, :ELO_7x7
  	remove_column :users, :ELO_OH
  	remove_column :users, :ELO_megaminx
  	remove_column :users, :ELO_pyraminx
  	remove_column :users, :ELO_square1
  	remove_column :users, :ELO_clock
  	remove_column :users, :ELO_skewb



  	add_column :users, :ELO_2x2, :integer, default: 800
  	add_column :users, :ELO_3x3, :integer, default: 800
  	add_column :users, :ELO_4x4, :integer, default: 800
  	add_column :users, :ELO_5x5, :integer, default: 800
  	add_column :users, :ELO_6x6, :integer, default: 800
  	add_column :users, :ELO_7x7, :integer, default: 800
  	add_column :users, :ELO_3x3OH, :integer, default: 800
  	add_column :users, :ELO_Megaminx, :integer, default: 800
  	add_column :users, :ELO_Pyraminx, :integer, default: 800
  	add_column :users, :ELO_Square1, :integer, default: 800
  	add_column :users, :ELO_Clock, :integer, default: 800
  	add_column :users, :ELO_Skewb, :integer, default: 800
  end
end
