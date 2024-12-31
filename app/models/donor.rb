class Donor < ApplicationRecord
  belongs_to :user

  has_many :donor_history_questionnaires, dependent: :destroy
  # validates :first_name, presence: true, length: { maximum: 50 }
  # validates :middle_name, length: { maximum: 50 }, allow_nil: true
  # validates :last_name, presence: true, length: { maximum: 50 }
  # validates :birth_date, presence: true
  # validates :gender, inclusion: { in: ['Male', 'Female', 'Other'], message: "%{value} is not a valid gender" }, allow_nil: true
  # validates :zipcode, presence: true
  # validates :phone_number, presence: true, format: { with: /\A\+?\d{1,4}?[ -]?\(?\d{1,4}?\)?[ -]?\d{1,4}?[ -]?\d{1,4}\z/, message: "must be a valid phone number" }
  # validates :alternate_phone_number, format: { with: /\A\+?\d{1,4}?[ -]?\(?\d{1,4}?\)?[ -]?\d{1,4}?[ -]?\d{1,4}\z/, message: "must be a valid phone number" }, allow_nil: true
  # validates :city, presence: true, length: { maximum: 100 }
  # validates :state, presence: true, length: { maximum: 100 }
  # validates :country, presence: true, length: { maximum: 100 }
  # validates :language, inclusion: { in: ['English', 'Spanish', 'French', 'Other'], message: "%{value} is not a valid language" }, allow_nil: true
  # validates :address_line1, presence: true, length: { maximum: 200 }
  # validates :address_line2, length: { maximum: 200 }, allow_nil: true
  # validates :document, length: { maximum: 1000 }, allow_nil: true
  # validates :arrival_datetime, presence: true
  # validates :potential_fraud, inclusion: { in: ['Yes', 'No'], message: "%{value} is not a valid option" }, allow_nil: true
end
