class InitEloCorrectly < ActiveRecord::Migration
  def change
  	remove_column :users, :ELO_2x2
    remove_column :users, :ELO_3x3
    remove_column :users, :ELO_4x4
    remove_column :users, :ELO_5x5
    remove_column :users, :ELO_6x6
    remove_column :users, :ELO_7x7
    remove_column :users, :ELO_3x3OH
    remove_column :users, :ELO_Megaminx
    remove_column :users, :ELO_Pyraminx
    remove_column :users, :ELO_Square1
    remove_column :users, :ELO_Clock
    remove_column :users, :ELO_Skewb



  	add_column :users, :ELO_2x2, :integer, default: 0
  	add_column :users, :ELO_3x3, :integer, default: 0
  	add_column :users, :ELO_4x4, :integer, default: 0
  	add_column :users, :ELO_5x5, :integer, default: 0
  	add_column :users, :ELO_6x6, :integer, default: 0
  	add_column :users, :ELO_7x7, :integer, default: 0
  	add_column :users, :ELO_3x3OH, :integer, default: 0
  	add_column :users, :ELO_Megaminx, :integer, default: 0
  	add_column :users, :ELO_Pyraminx, :integer, default: 0
  	add_column :users, :ELO_Square1, :integer, default: 0
  	add_column :users, :ELO_Clock, :integer, default: 0
  	add_column :users, :ELO_Skewb, :integer, default: 0
  end
end
