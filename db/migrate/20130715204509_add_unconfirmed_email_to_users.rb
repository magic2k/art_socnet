class AddUnconfirmedEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :unconfirmed_email, :string, default: false
  end
end
