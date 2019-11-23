class AddSubscriptionRefToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_reference :accounts, :subscription, foreign_key: true
  end
end
