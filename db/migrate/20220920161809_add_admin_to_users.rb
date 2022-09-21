class AddAdminToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :admin, :boolean, default: false # => adminはデフォルトでnilになるが、default: falseを指定することで、明示的にする
  end
end
