class RenameColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :remember_token, :remember_digest
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
