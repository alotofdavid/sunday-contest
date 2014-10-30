class Addelos < ActiveRecord::Migration
  def change
  	add_column :users, :ELO_2x2, :integer, default: 800
  	add_column :users, :ELO_3x3, :integer, default: 800
  	add_column :users, :ELO_4x4, :integer, default: 800
  	add_column :users, :ELO_5x5, :integer, default: 800
  	add_column :users, :ELO_6x6, :integer, default: 800
  	add_column :users, :ELO_7x7, :integer, default: 800
  	add_column :users, :ELO_OH, :integer, default: 800
  	add_column :users, :ELO_megaminx, :integer, default: 800
  	add_column :users, :ELO_pyraminx, :integer, default: 800
  	add_column :users, :ELO_square1, :integer, default: 800
  	add_column :users, :ELO_clock, :integer, default: 800
  	add_column :users, :ELO_skewb, :integer, default: 800
  end
end
