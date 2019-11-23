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

class ReadingChallenge < ApplicationRecord

    validates :book_title, length: { maximum: 256, message: 'Length too long.'}, presence: true
    validates :comment, length: { maximum: 100, message: 'Length too long.'}, presence: true
    validates :reading_date, length: { maximum: 12, message: 'Length too long.'}, presence: true

end
