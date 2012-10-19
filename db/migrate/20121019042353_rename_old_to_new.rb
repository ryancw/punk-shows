class RenameOldToNew < ActiveRecord::Migration
    def change
        rename_table :microposts, :shows
    end 
end
