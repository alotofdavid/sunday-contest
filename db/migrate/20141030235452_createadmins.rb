class Createadmins < ActiveRecord::Migration
  def change
  	add_column :users, :isMod, :boolean, default: false
  	add_column :users, :isAdmin, :boolean, default: false
  end
end
