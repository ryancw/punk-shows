class AddUserIdToBands < ActiveRecord::Migration
  def change
  	add_column :bands, :user_id, :integer
  end
end
