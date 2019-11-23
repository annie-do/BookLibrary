# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  comment    :text
#  rating     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :integer
#
# Indexes
#
#  index_reviews_on_book_id  (book_id)
#

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
