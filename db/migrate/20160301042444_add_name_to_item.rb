class AddNameToItem < ActiveRecord::Migration
  def change
    add_column :items, :name, :string
    add_column :items, :description, :text
    add_column :items, :genre_id,:integer
    add_column :items, :url, :string
  end
end
