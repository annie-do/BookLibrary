# == Schema Information
#
# Table name: subscriptions
#
#  id         :integer          not null, primary key
#  end_date   :datetime
#  price      :float
#  start_date :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :integer
#
# Indexes
#
#  index_subscriptions_on_account_id  (account_id)
#

require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
