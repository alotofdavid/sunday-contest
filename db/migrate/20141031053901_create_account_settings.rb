class CreateAccountSettings < ActiveRecord::Migration
  def change
    create_table :account_settings do |t|

      t.timestamps
    end
  end
end
