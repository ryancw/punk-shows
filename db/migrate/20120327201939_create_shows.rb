class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :shows, [:user_id, :created_at]
  end
end