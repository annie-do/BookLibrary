class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.text :summary
      t.decimal :price
      t.string :cover_url
      t.string :ownership
      t.timestamps
    end
  end
end
