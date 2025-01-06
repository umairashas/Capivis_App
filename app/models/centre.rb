class Centre < ApplicationRecord
  belongs_to :user
    has_many :donor
    has_many :donor_screenings, dependent: :destroy
    has_many :donors, dependent: :destroy
end
