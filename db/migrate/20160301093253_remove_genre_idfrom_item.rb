class RemoveGenreIdfromItem < ActiveRecord::Migration
  def change
  	remove_column :items,:genre_id
  end
end
