class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :nickname
      t.text :body
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
