class CreateRshows < ActiveRecord::Migration
  def change
    create_table :rshows do |t|
      t.date :date
      t.string :location
      t.string :acts
      t.text :details
      t.integer :user_id

      t.timestamps
    end
    add_index :rshows, [:user_id, :date]
  end
end
