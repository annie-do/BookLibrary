class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.float :price
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
