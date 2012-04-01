class AddDetailsToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :date, :date

    add_column :microposts, :location, :string

    add_column :microposts, :acts, :string

    add_column :microposts, :details, :text

  end
end
