class ConfirmEmail < ActiveRecord::Migration
  def change
  	add_column :users, :email_confirmed, :boolean, default: false
  	users = User.all
  	users.each do|user|
  		user.email_confirmed = true
  		user.save()
  	end
  end
end
