class AddUserIdToTraxes < ActiveRecord::Migration
  def change
    add_column :traxes, :user_id, :integer
  end
end
