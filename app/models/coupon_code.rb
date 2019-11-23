# == Schema Information
#
# Table name: coupon_codes
#
#  id         :integer          not null, primary key
#  code       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CouponCode < ApplicationRecord
    
    validates :code, format: {with: /[A-Z]*/}, length: { maximum: 20}, presence: true

end
