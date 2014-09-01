class PasswordDigest < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    User.reset_column_information
    User.all.each do |user|
      digest = Digest::SHA2.new(512)
      encryptedPassword = digest.hexdigest(user.salt.to_s + user.login)
      user.update_attribute :password_digest, encryptedPassword
    end
  end
end

