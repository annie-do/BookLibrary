class CreateCouponCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :coupon_codes do |t|
      t.string :code

      t.timestamps
    end
  end
end
