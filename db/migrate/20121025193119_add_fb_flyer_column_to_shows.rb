class AddFbFlyerColumnToShows < ActiveRecord::Migration
  def change
    add_column :shows, :fblink, :string

    add_column :shows, :flyerlink, :string

    add_column :shows, :altlink, :string

  end
end
