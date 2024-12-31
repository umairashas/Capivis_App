class Centre < ApplicationRecord
	has_secure_password
	belongs_to :user
    validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :pincode, presence: true, numericality: true
  validates :phone_number, presence: true, length: { is: 10 }
end
