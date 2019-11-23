class AddBookstoreRefToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :bookstore, foreign_key: true
  end
end
