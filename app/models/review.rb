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

class Review < ApplicationRecord

belongs_to :media, class_name: "Book", foreign_key: "book_id", inverse_of: :critiques
#Validations here
validates :rating, presence: true
validates :comment, length: {maximum: 500}
end
