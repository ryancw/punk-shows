class ConnectUserToBand < ActiveRecord::Migration
  def change
	add_column :bands, :user_id, :integer
	add_index :bands, [:user_id, :created_at]
  end
end
