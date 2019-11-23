class AddAccountRefToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :account, foreign_key: true
  end
end
