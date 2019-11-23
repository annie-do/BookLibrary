# == Schema Information
#
# Table name: books
#
#  id           :integer          not null, primary key
#  author       :string
#  cover_url    :string
#  genre        :string
#  ownership    :string
#  price        :decimal(, )
#  summary      :text
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  account_id   :integer
#  bookstore_id :integer
#
# Indexes
#
#  index_books_on_account_id    (account_id)
#  index_books_on_bookstore_id  (bookstore_id)
#

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
