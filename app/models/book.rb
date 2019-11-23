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

class Book < ApplicationRecord
    # class_name: "Bookstore", foreign_key: "bookstore_id", inverse_of: :books
    has_and_belongs_to_many :accounts
    has_many :critiques, class_name: "Review", foreign_key: "book_id", inverse_of: :media, dependent: :destroy
    validates :title, format: {with: /[A-Z][a-z]*/}, presence: true
    validates :author, format: {with: /[A-Z][a-z]*/}, presence: true, unique: false
    validates :genre, inclusion: {in: %W(mystery fantasy horror adventure action romance nonfiction comedy childrens scifi religious graphic thriller biography literature)}, presence: true
    validates :summary, length: { maximum: 2000} , presence: true
    validates :price, numericality: {greater_than: 0}, format: {with: /[0-9]*\.[0-9]*{2}/}, presence: true
    validates :cover_url, presence: true, format: { with: /(http\:\/\/|https\:\/\/)?([a-zA-Z0-9][a-zA-Z0-9\-]*\.)+[a-zA-Z0-9][a-zA-Z0-9\-]+/, message: "uhoh" }
end
