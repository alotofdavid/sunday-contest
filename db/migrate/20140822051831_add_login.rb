class AddLogin < ActiveRecord::Migration
  def change
    add_column :users, :login, :string
    User.reset_column_information
    User.all.each do |user|
      user.update_attribute :login, user.last_name.downcase
    end
  end
end

