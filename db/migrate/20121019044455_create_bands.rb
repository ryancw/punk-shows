class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name
      t.text :description
      t.date :established
      t.boolean :active
      t.string :city
      t.integer :user_id

      t.timestamps
    end
    add_index :shows, [:user_id, :created_at]
  end
end
