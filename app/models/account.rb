# == Schema Information
#
# Table name: accounts
#
#  id                     :integer          not null, primary key
#  admin                  :boolean          default(FALSE)
#  avatar                 :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  subscription_id        :integer
#
# Indexes
#
#  index_accounts_on_email                 (email) UNIQUE
#  index_accounts_on_reset_password_token  (reset_password_token) UNIQUE
#  index_accounts_on_subscription_id       (subscription_id)
#  index_accounts_on_username              (username) UNIQUE
#

class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :books
  has_one :subscription

  before_create :set_username

  private
    def set_username
      self.username = self.email[/^[^@]+/]
    end
end
