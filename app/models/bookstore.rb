# == Schema Information
#
# Table name: bookstores
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Bookstore < ApplicationRecord
    has_many :books, class_name: "Book", foreign_key: "bookstore_id", inverse_of: :bookstore, dependent: :destroy

    validates :name, format: {with: /[A-Z][a-z]*/}, presence: true
end
