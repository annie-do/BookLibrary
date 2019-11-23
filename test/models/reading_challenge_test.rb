# == Schema Information
#
# Table name: reading_challenges
#
#  id           :integer          not null, primary key
#  book_title   :string
#  comment      :string
#  reading_date :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class ReadingChallengeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
