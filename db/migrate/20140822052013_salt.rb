class Salt < ActiveRecord::Migration
  def change
    add_column :users, :salt, :string
    User.reset_column_information
    User.all.each do |user|
      saltString = SecureRandom.hex(20)
      user.update_attribute :salt, saltString
    end
  end
end
  
