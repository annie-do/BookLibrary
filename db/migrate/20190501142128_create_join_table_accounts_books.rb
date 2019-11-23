class CreateJoinTableAccountsBooks < ActiveRecord::Migration[5.2]
  def change
    create_join_table :accounts, :books do |t|
      # t.index [:account_id, :book_id]
      # t.index [:book_id, :account_id]
    end
  end
end
